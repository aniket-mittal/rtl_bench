module origen_187365(
    input clk,
    input [9:0] posbarraiy,
    input [9:0] posbarrady,
    output reg [9:0] posx,
    output reg [9:0] posy,
    output reg vidasi,
    output reg vidasd,
    output reg pierdei,
    output reg pierded
);

    reg clk2;
    reg [15:0] count = 0;
    reg dirx = 1, diry = 1;

    always @(posedge clk) begin
        count <= count + 1;
        if (count == 16'hFFFF) begin
            count <= 0;
            clk2 <= ~clk2;
        end
    end

    [MASKED]

    initial begin
        posx <= 10'd280;
        posy <= 10'd220;
        vidasi <= 8'd3;
        vidasd <= 8'd3;
        clk2 <= 0;
        pierdei <= 0;
        pierded <= 0;
    end

endmodule