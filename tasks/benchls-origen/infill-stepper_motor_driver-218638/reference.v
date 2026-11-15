module origen_218638(
    input clk,
    input rst_n,
    input D2,
    input D3,
    output reg [3:0] motor
);

reg IN4, IN3, IN2, IN1;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        IN4 <= 0;
        IN3 <= 0;
        IN2 <= 0;
        IN1 <= 0;
        motor <= 4'b0000;
    end
    else begin
        case ({D2, D3})
            2'b00: begin
                IN4 <= 0;
                IN3 <= 0;
                IN2 <= 0;
                IN1 <= 0;
                motor <= {IN4, IN3, IN2, IN1};
            end
            2'b01: begin
                IN4 <= 1;
                IN3 <= 0;
                IN2 <= 0;
                IN1 <= 0;
                motor <= {IN4, IN3, IN2, IN1};
            end
            2'b10: begin
                IN4 <= 0;
                IN3 <= 0;
                IN2 <= 0;
                IN1 <= 1;
                motor <= {IN4, IN3, IN2, IN1};
            end
            2'b11: begin
                IN4 <= 1;
                IN3 <= 0;
                IN2 <= 0;
                IN1 <= 1;
                motor <= {IN4, IN3, IN2, IN1};
            end
        endcase
    end
end

endmodule