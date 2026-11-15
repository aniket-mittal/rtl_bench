module origen_043775 (
    input wire Clock,
    input wire Reset,
    input wire Trig,
    output reg Tack,
    output reg [1:0] Tag
);

    // State encoding
    localparam [1:0] IDLE = 2'b00,
                     CB01 = 2'b01,
                     CB02 = 2'b10;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge Clock or posedge Reset) begin
        if (Reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: next_state = Trig ? CB01 : IDLE;
            CB01: next_state = CB02;
            CB02: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            Tack <= 1'b0;
            Tag <= 2'b00;
        end else begin
            case (current_state)
                IDLE: begin
                    Tack <= 1'b0;
                end
                CB01: begin
                    Tag[1] <= Trig;
                end
                CB02: begin
                    Tag[0] <= Trig;
                    Tack <= 1'b1;
                end
            endcase
        end
    end

endmodule