module origen_199459(
    input start,
    input [10:0] lowerXBound, upperXBound, lowerYBound, upperYBound,
    input clock, reset_n,
    output reg [10:0] x, y,
    output reg [2:0] colour,
    output reg writeEn,
    output reg done
);

reg [10:0] xIteration, yIteration;

always @(posedge clock or negedge reset_n) begin
    if (~reset_n) begin
        xIteration <= upperXBound;
        yIteration <= upperYBound;
        x <= 0;
        y <= 0;
        colour <= 0;
        writeEn <= 0;
        done <= 1;
    end else if (start) begin
        xIteration <= lowerXBound;
        yIteration <= lowerYBound;
        x <= 0;
        y <= 0;
        colour <= 0;
        writeEn <= 0;
        done <= 0;
    end else begin
        if (xIteration <= upperXBound && yIteration <= upperYBound) begin
            x <= xIteration;
            y <= yIteration;
            colour <= 0;
            writeEn <= 1;
            xIteration <= xIteration + 1;
            if (xIteration > upperXBound) begin
                xIteration <= lowerXBound;
                yIteration <= yIteration + 1;
            end
        end else begin
            x <= 0;
            y <= 0;
            colour <= 0;
            writeEn <= 0;
            done <= 1;
        end
    end
end

endmodule