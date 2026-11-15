module origen_093561 (
    input wire clk_control,
    input wire [7:0] control,
    input wire [11:0] data_0, data_1, data_2, data_3,
    input wire en,
    input wire [8:0] addr,
    output reg [11:0] data_out,
    output reg en_0, en_1, en_2, en_3,
    output reg [8:0] addr_0, addr_1, addr_2, addr_3,
    output reg [8:0] freq
);

    reg [11:0] data;

    always @(posedge clk_control) begin
        // Data Selection
        case (control[7:6])
            2'b00: data <= data_0;
            2'b01: data <= data_1;
            2'b10: data <= data_2;
            2'b11: data <= data_3;
        endcase

        // Enable and Address Routing
        {en_0, en_1, en_2, en_3} <= 4'b0;
        {addr_0, addr_1, addr_2, addr_3} <= {36{1'b0}};
        case (control[7:6])
            2'b00: begin en_0 <= en; addr_0 <= addr; end
            2'b01: begin en_1 <= en; addr_1 <= addr; end
            2'b10: begin en_2 <= en; addr_2 <= addr; end
            2'b11: begin en_3 <= en; addr_3 <= addr; end
        endcase

        // Data Manipulation
        case (control[5:3])
            3'b000: data_out <= data;
            3'b001: data_out <= data >> 1;
            3'b010: data_out <= data >> 2;
            3'b011: data_out <= data >> 3;
            3'b100: data_out <= data << 1;
            3'b101: data_out <= data << 2;
            3'b110: data_out <= data << 3;
            3'b111: data_out <= data;
        endcase

        // Frequency Selection
        case (control[1:0])
            2'b00: freq <= 9'd1;
            2'b01: freq <= 9'd2;
            2'b10: freq <= 9'd4;
            2'b11: freq <= 9'd8;
        endcase
    end

endmodule