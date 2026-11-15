module origen_005849 (
    input wire clk,
    input wire rst,
    input wire din,
    output reg [7:0] count
);

    reg [2:0] state;
    reg [7:0] i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 3'd0;
            count <= 8'd0;
            i <= 8'd0;
        end else begin
            case (state)
                3'd0: begin
                    if (din) begin
                        state <= 3'd1;
                        count <= 8'd1;
                    end
                end
                3'd1: begin
                    if (din)
                        state <= 3'd3;
                    else
                        state <= 3'd2;
                end
                3'd2: begin
                    if (din)
                        state <= 3'd1;
                end
                3'd3: begin
                    if (~din)
                        state <= 3'd4;
                end
                3'd4: begin
                    if (din)
                        state <= 3'd3;
                    else begin
                        state <= 3'd2;
                        count <= count + 1;
                    end
                end
                default: state <= 3'd0;
            endcase
        end
    end

endmodule