module origen_134895 (
    input wire clk,
    input wire [8:0] note,
    output reg [31:0] frequency
);

    // Lookup table for note frequencies
    reg [31:0] freq_table [0:15];
    initial begin
        freq_table[0]  = 32'd261634; // C0
        freq_table[1]  = 32'd277183;
        freq_table[2]  = 32'd293665;
        freq_table[3]  = 32'd311127;
        freq_table[4]  = 32'd329628;
        freq_table[5]  = 32'd349228;
        freq_table[6]  = 32'd369994;
        freq_table[7]  = 32'd391995;
        freq_table[8]  = 32'd415305;
        freq_table[9]  = 32'd440000;
        freq_table[10] = 32'd466164;
        freq_table[11] = 32'd493883;
        freq_table[12] = 32'd523251;
        freq_table[13] = 32'd554365;
        freq_table[14] = 32'd587330;
        freq_table[15] = 32'd622254;
    end

    reg [5:0] octave;
    reg [3:0] note_in_octave;
    reg [5:0] divider;

    always @(posedge clk) begin
        // Calculate octave and note within octave
        octave = note / 12;
        note_in_octave = note % 12;

        // Calculate divider based on octave
        if (octave <= 4)
            divider = 16 - octave;
        else if (octave <= 8)
            divider = 8 + ((octave - 4) * 6);
        else
            divider = 42;

        // Calculate frequency
        frequency = freq_table[note_in_octave] >> divider;

        // Apply additional octave adjustments if needed
        if (note[8:6] == 3'b111)
            frequency = frequency >> 1;  // Divide by 2 (one octave lower)
        else if (note[8:7] == 2'b11)
            frequency = frequency >> 2;  // Divide by 4 (two octaves lower)
    end

endmodule