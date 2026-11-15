module origen_111323 (
    input wire clk,
    input wire reset,
    input wire Start,
    output wire Shot
);

    // State encoding
    localparam [1:0] Waiting_Shot = 2'b00,
                     Shot_State = 2'b01,
                     Waiting_Not_Shot = 2'b10;

    // State register
    reg [1:0] state, next_state;

    // Output register
    reg Shot_reg;

    // State transition logic
    always @(posedge clk or negedge reset) begin
        if (!reset)
            state <= Waiting_Shot;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            Waiting_Shot:
                next_state = Start ? Shot_State : Waiting_Shot;
            Shot_State:
                next_state = Waiting_Not_Shot;
            Waiting_Not_Shot:
                next_state = Start ? Waiting_Not_Shot : Waiting_Shot;
            default:
                next_state = Shot_State;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            Waiting_Shot:
                Shot_reg = 1'b0;
            Shot_State:
                Shot_reg = 1'b1;
            Waiting_Not_Shot:
                Shot_reg = 1'b0;
            default:
                Shot_reg = 1'b0;
        endcase
    end

    // Output assignment
    assign Shot = Shot_reg;

endmodule