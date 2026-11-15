module origen_205408(
    input rst,
    input clk,
    input dispen,
    input [15:0] cntr,
    output reg [7:0] seg,
    output reg [3:0] an
);

    reg [1:0] sel;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sel <= 2'b00;
        end else if (dispen) begin
            sel <= sel + 2'b01;
        end
    end

    wire [3:0] seg_dig;
    assign seg_dig = (sel == 2'b00) ? cntr[3:0] :
                     (sel == 2'b01) ? cntr[7:4] :
                     (sel == 2'b10) ? cntr[11:8] :
                                     cntr[15:12];

    [MASKED]

endmodule