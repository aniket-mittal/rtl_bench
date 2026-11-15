module origen_030222 (
    input wire iCLK,
    input wire [12:0] iXstart,
    input wire [12:0] iYstart,
    input wire [9:0] reading_sram,
    input wire [9:0] reading_search,
    output reg [12:0] oX_sram,
    output reg [12:0] oY_sram,
    output reg [12:0] oX_search,
    output reg [12:0] oY_search,
    output reg finished
);

    reg [12:0] Xcoord, Ycoord;
    reg [19:0] endScore;
    reg [9:0] score;

    always @(posedge iCLK) begin
        if (Xcoord == 0 && Ycoord == 0) begin
            Xcoord <= 0;
            Ycoord <= 0;
            endScore <= 0;
            finished <= 0;
        end else begin
            if (reading_sram > reading_search) begin
                score <= (reading_sram - reading_search < 1023) ? reading_sram - reading_search : 1023;
            end else begin
                score <= (reading_search - reading_sram < 1023) ? reading_search - reading_sram : 1023;
            end

            endScore <= endScore + score;

            if (Xcoord == 511 && Ycoord == 383) begin
                finished <= 1;
            end else if (Xcoord == 511) begin
                Xcoord <= 0;
                Ycoord <= Ycoord + 1;
            end else begin
                Xcoord <= Xcoord + 1;
            end
        end

        oX_sram <= iXstart + Xcoord;
        oY_sram <= iYstart + Ycoord;
        oX_search <= Xcoord;
        oY_search <= Ycoord;
    end

    always @(iXstart or iYstart) begin
        Xcoord <= 0;
        Ycoord <= 0;
        endScore <= 0;
        finished <= 0;
    end

endmodule