module origen_062837 (
    input wire clk,
    input wire reset,
    input wire [7:0] img_di,
    input wire [19:0] grad_di,
    output reg done,
    output reg img_wr,
    output reg img_rd,
    output reg grad_wr,
    output reg grad_rd,
    output reg [15:0] img_addr,
    output reg [15:0] grad_addr,
    output reg [7:0] img_do,
    output reg [19:0] grad_do
);

    reg [15:0] counter;
    reg [7:0] counter_1;
    reg [7:0] counter_256;
    reg [7:0] x_1, x_2, x_3;
    reg ctrl, cal, rd, wr, init;
    reg [15:0] img_addr_reg, grad_addr_reg;

    wire signed [9:0] gx, gy;

    assign gx = {2'b0, x_2} - {2'b0, x_1};
    assign gy = {2'b0, x_3} - {2'b0, x_1};

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 16'd0;
            counter_1 <= 8'd0;
            counter_256 <= 8'd0;
            ctrl <= 1'b0;
            cal <= 1'b0;
            rd <= 1'b0;
            wr <= 1'b0;
            init <= 1'b1;
            done <= 1'b0;
            img_wr <= 1'b0;
            img_rd <= 1'b1;
            grad_wr <= 1'b0;
            grad_rd <= 1'b0;
            img_addr <= 16'd0;
            grad_addr <= 16'd0;
            img_addr_reg <= 16'd0;
            grad_addr_reg <= 16'd0;
        end else begin
            if (init) begin
                x_2 <= img_di;
                init <= 1'b0;
                rd <= 1'b1;
                img_addr <= 16'd1;
            end else if (rd) begin
                if (ctrl) begin
                    x_3 <= img_di;
                    rd <= 1'b0;
                    cal <= 1'b1;
                    img_addr <= img_addr_reg;
                end else begin
                    x_1 <= x_2;
                    x_2 <= img_di;
                    img_addr <= img_addr + 16'd256;
                    img_addr_reg <= img_addr;
                    ctrl <= 1'b1;
                end
            end else if (cal) begin
                grad_do <= {gx[9:0], gy[9:0]};
                cal <= 1'b0;
                wr <= 1'b1;
                grad_wr <= 1'b1;
            end else if (wr) begin
                grad_wr <= 1'b0;
                wr <= 1'b0;
                rd <= 1'b1;
                ctrl <= 1'b0;
                img_rd <= 1'b1;
                counter <= counter + 16'd1;
                grad_addr <= grad_addr + 16'd1;
                
                if (counter_1 == 8'd254) begin
                    counter_1 <= 8'd0;
                    if (counter_256 == 8'd254) begin
                        counter_256 <= 8'd0;
                    end else begin
                        counter_256 <= counter_256 + 8'd1;
                        img_addr <= img_addr_reg + 16'd1;
                    end
                end else begin
                    counter_1 <= counter_1 + 8'd1;
                    img_addr <= img_addr_reg + 16'd1;
                end
                
                if (counter == 16'd65280) begin
                    done <= 1'b1;
                    img_rd <= 1'b0;
                end
            end
        end
    end

endmodule