module origen_039691(
    input DE, pixClk, Vsync, Hsync,
    input [7:0] red, green, blue,
    output reg [14:0] addr,
    output reg [7:0] pixData,
    output reg wrPix
);

reg [8:0] pixCounter;
reg [8:0] colCounter;
reg [8:0] lineCounter;
reg lineOdd;
reg [7:0] lineMem [319:0];

always @(posedge pixClk) begin
    if (Hsync) begin
        pixCounter <= 0;
        colCounter <= 0;
        wrPix <= 0;
    end else if (DE) begin
        pixCounter <= pixCounter + 1;
        if (lineOdd) begin
            case (pixCounter % 8)
                0: pixData[3:0] <= (red > 50) ? 4'b1111 : 4'b0000;
                4: pixData[7:4] <= (red > 150) ? 4'b1111 : 4'b0000;
                6: begin
                    wrPix <= 1;
                    colCounter <= colCounter + 1;
                end
                7: wrPix <= 0;
            endcase
        end else begin
            if (pixCounter < 320) begin
                lineMem[pixCounter] <= red;
            end
        end
    end
end

always @(negedge Vsync or negedge DE) begin
    if (!Vsync) begin
        lineCounter <= 0;
        lineOdd <= 1;
    end else if (!DE) begin
        lineCounter <= lineCounter + 1;
        lineOdd <= ~lineOdd;
    end
end

always @(*) begin
    addr = colCounter + (lineCounter * 80);
end

endmodule