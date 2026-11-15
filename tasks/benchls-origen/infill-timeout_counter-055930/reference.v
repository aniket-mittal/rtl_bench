module origen_055930 (
    input wire Start,
    input wire Clk,
    input wire Reset,
    input wire Tclear,
    input wire [31:0] Timeout,
    output reg T,
    output reg [31:0] I
);

    // State encoding
    localparam INITIAL = 1'b0;
    localparam WAIT = 1'b1;

    reg state, next_state;

    // State register
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            state <= INITIAL;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            INITIAL: next_state = (Start && !Tclear) ? WAIT : INITIAL;
            WAIT: next_state = (I == Timeout || Tclear) ? INITIAL : WAIT;
            default: next_state = INITIAL;
        endcase
    end

    // Output logic
    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            I <= 32'b0;
            T <= 1'b0;
        end else begin
            case (state)
                INITIAL: begin
                    I <= 32'b0;
                    T <= 1'b0;
                end
                WAIT: begin
                    I <= I + 1;
                    if (I == Timeout) begin
                        T <= 1'b1;
                    end
                end
            endcase
        end
    end

endmodule