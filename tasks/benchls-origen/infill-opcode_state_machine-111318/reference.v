module origen_111318 #(
    parameter DATA_WIDTH = 9
) (
    input logic clk,
    input logic reset,
    input logic [DATA_WIDTH-1:0] InstructorRegister,
    output logic [15:0] outStateMachine,
    output logic done
);

    typedef enum logic [3:0] {
        MOV  = 4'b0000,
        MOVI = 4'b0001,
        ADD  = 4'b0010,
        SUB  = 4'b0011,
        AND  = 4'b0100,
        OR   = 4'b0101,
        SL   = 4'b0110,
        SR   = 4'b0111
    } opcode_t;

    typedef enum logic [3:0] {
        INITIAL = 4'b0000,
        MOV1    = 4'b0001,
        MOV2    = 4'b0010,
        MOVI1   = 4'b0011,
        MOVI2   = 4'b0100,
        ADD1    = 4'b0101,
        SUB1    = 4'b0110,
        AND1    = 4'b0111,
        OR1     = 4'b1000,
        SL1     = 4'b1001,
        SR1     = 4'b1010
    } state_t;

    state_t current_state, next_state;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= INITIAL;
            done <= 1'b0;
        end else begin
            current_state <= next_state;
        end
    end

    always_comb begin
        next_state = current_state;
        outStateMachine = 16'b0;
        done = 1'b0;
        
        case (current_state)
            INITIAL: begin
                case (InstructorRegister[DATA_WIDTH-1:DATA_WIDTH-4])
                    MOV:  next_state = MOV1;
                    MOVI: next_state = MOVI1;
                    ADD:  next_state = ADD1;
                    SUB:  next_state = SUB1;
                    AND:  next_state = AND1;
                    OR:   next_state = OR1;
                    SL:   next_state = SL1;
                    SR:   next_state = SR1;
                    default: next_state = INITIAL;
                endcase
            end
            
            MOV1: begin
                outStateMachine = {12'b0, MOV};
                next_state = MOV2;
            end
            
            MOV2: begin
                outStateMachine = {12'b0, MOV};
                next_state = INITIAL;
                done = 1'b1;
            end
            
            MOVI1: begin
                outStateMachine = {12'b0, MOVI};
                next_state = MOVI2;
            end
            
            MOVI2: begin
                outStateMachine = {12'b0, MOVI};
                next_state = INITIAL;
                done = 1'b1;
            end
            
            ADD1: begin
                outStateMachine = {12'b0, ADD};
                next_state = INITIAL;
                done = 1'b1;
            end
            
            SUB1: begin
                outStateMachine = {12'b0, SUB};
                next_state = INITIAL;
                done = 1'b1;
            end
            
            AND1: begin
                outStateMachine = {12'b0, AND};
                next_state = INITIAL;
                done = 1'b1;
            end
            
            OR1: begin
                outStateMachine = {12'b0, OR};
                next_state = INITIAL;
                done = 1'b1;
            end
            
            SL1: begin
                outStateMachine = {12'b0, SL};
                next_state = INITIAL;
                done = 1'b1;
            end
            
            SR1: begin
                outStateMachine = {12'b0, SR};
                next_state = INITIAL;
                done = 1'b1;
            end
            
            default: begin
                next_state = INITIAL;
                done = 1'b0;
            end
        endcase
    end

endmodule