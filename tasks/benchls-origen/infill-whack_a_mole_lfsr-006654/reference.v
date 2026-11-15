module origen_006654 (
    input wire clk,
    input wire rst_n,
    output reg [15:0] mole_location
);

    reg [4:0] data, data_next;

    // LFSR combinational logic
    always @(*) begin
        data_next[0] = data[4] ^ data[2];
        data_next[1] = data[0];
        data_next[2] = data[1];
        data_next[3] = data[2];
        data_next[4] = data[3];
    end

    // LFSR sequential logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data <= 5'h1f;
        else
            data <= data_next;
    end

    // Mole location generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            mole_location <= 16'h0001;
        else begin
            case (data % 16)
                4'h0: mole_location <= 16'h0001;
                4'h1: mole_location <= 16'h0002;
                4'h2: mole_location <= 16'h0004;
                4'h3: mole_location <= 16'h0008;
                4'h4: mole_location <= 16'h0010;
                4'h5: mole_location <= 16'h0020;
                4'h6: mole_location <= 16'h0040;
                4'h7: mole_location <= 16'h0080;
                4'h8: mole_location <= 16'h0100;
                4'h9: mole_location <= 16'h0200;
                4'ha: mole_location <= 16'h0400;
                4'hb: mole_location <= 16'h0800;
                4'hc: mole_location <= 16'h1000;
                4'hd: mole_location <= 16'h2000;
                4'he: mole_location <= 16'h4000;
                4'hf: mole_location <= 16'hffff;
            endcase
        end
    end

endmodule