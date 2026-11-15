module origen_061407(
    input wire clk,
    input wire clk_en,
    input wire reset,
    input wire start,
    input wire [31:0] dataa,
    input wire [31:0] datab,
    output reg [31:0] result,
    output reg done
);

    // FSM states
    localparam IDLE = 2'd0, CALCULANDO = 2'd1, PRONTO = 2'd2;
    reg [1:0] state, next_state;

    // Sub-FSM states
    localparam SUB = 2'd0, CHECK = 2'd1, ADD = 2'd2, SHIFT = 2'd3;
    reg [1:0] sub_state;

    // Internal registers
    reg [31:0] quociente, divisor;
    reg [32:0] resto;
    reg [5:0] count;

    // FSM state transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else if (clk_en)
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = start ? CALCULANDO : IDLE;
            CALCULANDO: next_state = (count == 6'd33) ? PRONTO : CALCULANDO;
            PRONTO: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Main operation logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            quociente <= 32'd0;
            divisor <= 32'd0;
            resto <= 33'd0;
            count <= 6'd0;
            result <= 32'd0;
            done <= 1'b0;
            sub_state <= SUB;
        end else if (clk_en) begin
            case (state)
                IDLE: begin
                    if (start) begin
                        quociente <= 32'd0;
                        divisor <= datab;
                        resto <= {1'b0, dataa};
                        count <= 6'd0;
                        done <= 1'b0;
                    end
                end
                CALCULANDO: begin
                    case (sub_state)
                        SUB: begin
                            resto <= resto - {1'b0, divisor};
                            sub_state <= CHECK;
                        end
                        CHECK: begin
                            if (resto[32]) begin
                                sub_state <= ADD;
                            end else begin
                                quociente <= {quociente[30:0], 1'b1};
                                sub_state <= SHIFT;
                            end
                        end
                        ADD: begin
                            resto <= resto + {1'b0, divisor};
                            quociente <= {quociente[30:0], 1'b0};
                            sub_state <= SHIFT;
                        end
                        SHIFT: begin
                            divisor <= {1'b0, divisor[31:1]};
                            count <= count + 1;
                            sub_state <= SUB;
                        end
                    endcase
                end
                PRONTO: begin
                    result <= quociente;
                    done <= 1'b1;
                end
            endcase
        end
    end

endmodule