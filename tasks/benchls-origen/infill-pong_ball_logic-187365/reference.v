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

    always @(posedge clk2) begin
        if (posx == 10'd0 || posx == 10'd559) begin
            posx <= 10'd280;
            posy <= 10'd220;
            if (posx == 10'd0) vidasi <= vidasi - 1;
            else vidasd <= vidasd - 1;
            if (vidasi == 0) pierdei <= 1;
            if (vidasd == 0) pierded <= 1;
        end
        else begin
            if (diry && posy == 10'd0) diry <= ~diry;
            if (~diry && posy == posbarraiy) diry <= ~diry;
            if (dirx && posx == 10'd559) dirx <= ~dirx;
            if (~dirx && posx == 10'd0) dirx <= ~dirx;
            posx <= posx + (dirx ? 1 : -1);
            posy <= posy + (diry ? 1 : -1);
        end
    end

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