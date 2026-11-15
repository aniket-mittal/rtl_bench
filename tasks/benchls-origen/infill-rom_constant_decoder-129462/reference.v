module origen_129462 (
    input wire SNnotDB,
    input wire DBnotSN,
    input wire [7:0] RomExpConCtl,
    output reg Constantb,
    output reg Constantc,
    output reg Constantd,
    output reg Constante,
    output reg Constantf,
    output reg Constantg,
    output reg Constanth
);

    wire SNnotBD;
    wire [1:0] f;
    wire ROMbit;

    assign SNnotBD = SNnotDB & ~DBnotSN;
    assign f = RomExpConCtl[1:0];
    assign ROMbit = RomExpConCtl[2];

    always @(*) begin
        case ({f, SNnotBD})
            3'b011: begin
                Constantb = 1'b0;
                Constantc = 1'b0;
                Constantd = 1'b0;
                Constante = 1'b0;
                Constantf = 1'b1;
                Constantg = 1'b1;
                Constanth = 1'b0;
            end
            3'b010: begin
                Constantb = 1'b0;
                Constantc = 1'b0;
                Constantd = 1'b0;
                Constante = 1'b1;
                Constantf = 1'b1;
                Constantg = 1'b0;
                Constanth = 1'b1;
            end
            3'b111: begin
                Constantb = 1'b0;
                Constantc = 1'b0;
                Constantd = 1'b1;
                Constante = 1'b1;
                Constantf = 1'b1;
                Constantg = 1'b1;
                Constanth = 1'b1;
            end
            3'b110: begin
                Constantb = 1'b0;
                Constantc = 1'b1;
                Constantd = 1'b1;
                Constante = 1'b1;
                Constantf = 1'b1;
                Constantg = 1'b1;
                Constanth = 1'b1;
            end
            3'b00?: begin
                Constantb = 1'b0;
                Constantc = 1'b0;
                Constantd = 1'b0;
                Constante = 1'b0;
                Constantf = 1'b0;
                Constantg = 1'b0;
                Constanth = 1'b1;
            end
            3'b10?: begin
                Constantb = 1'b0;
                Constantc = 1'b0;
                Constantd = 1'b0;
                Constante = 1'b1;
                Constantf = 1'b1;
                Constantg = 1'b1;
                Constanth = 1'b1;
            end
            default: begin
                Constantb = 1'b0;
                Constantc = 1'b0;
                Constantd = 1'b0;
                Constante = 1'b0;
                Constantf = 1'b0;
                Constantg = 1'b0;
                Constanth = 1'b0;
            end
        endcase
    end

endmodule