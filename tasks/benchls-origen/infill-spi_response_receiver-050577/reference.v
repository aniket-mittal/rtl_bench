module origen_050577 (
    input wire DO,
    input wire [5:0] cmd,
    input wire clk,
    input wire reset,
    output reg isNewResponse,
    output reg [39:0] response,
    output wire isRPFinish
);

    reg [1:0] state;
    reg [5:0] i;

    parameter IDLE = 2'b00;
    parameter RECEIVE = 2'b01;
    parameter FINALIZE = 2'b10;

    assign isRPFinish = (i == 6'd0);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            response <= 40'hFFFFFFFFFF;
            isNewResponse <= 1'b0;
            i <= 6'd39;
        end else begin
            case (state)
                IDLE: begin
                    if (!DO) begin
                        state <= RECEIVE;
                        response <= 40'd0;
                        i <= (cmd == 6'd8 || cmd == 6'd58) ? 6'd39 : 6'd7;
                    end
                end

                RECEIVE: begin
                    response <= {response[38:0], DO};
                    i <= i - 1'b1;
                    if (i == 6'd0) begin
                        state <= FINALIZE;
                    end
                end

                FINALIZE: begin
                    response[0] <= ~response[0];
                    isNewResponse <= 1'b1;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule