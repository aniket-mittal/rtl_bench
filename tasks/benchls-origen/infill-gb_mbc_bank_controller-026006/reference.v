module origen_026006(
    input [7:0] gb_data,
    input gb_write_n,
    input rst_n,
    input cs_n,
    input addr_15, addr_14, addr_13, addr_12,
    output [8:0] rom_addr,
    output [3:0] ram_addr,
    output ram_cs_n
);

    reg RAM_enable;
    reg [8:0] ROM_bank;
    reg [3:0] RAM_bank;
    reg rom_mode;

    // RAM Enable
    always @(negedge gb_write_n or negedge rst_n) begin
        if (!rst_n)
            RAM_enable <= 1'b0;
        else if ({addr_15, addr_14, addr_13, addr_12} == 4'b0000)
            RAM_enable <= (gb_data[3:0] == 4'hA);
    end

    // ROM Bank Selection
    always @(negedge gb_write_n or negedge rst_n) begin
        if (!rst_n)
            ROM_bank <= 9'b0;
        else if ({addr_15, addr_14, addr_13, addr_12} == 4'b0010)
            ROM_bank[7:0] <= gb_data;
        else if ({addr_15, addr_14, addr_13, addr_12} == 4'b0011)
            ROM_bank[8] <= gb_data[0];
    end

    // RAM Bank Selection
    always @(negedge gb_write_n or negedge rst_n) begin
        if (!rst_n)
            RAM_bank <= 4'b0;
        else if ({addr_15, addr_14, addr_13, addr_12} == 4'b0100)
            RAM_bank <= gb_data[3:0];
    end

    // ROM/RAM Mode Selection
    always @(negedge gb_write_n or negedge rst_n) begin
        if (!rst_n)
            rom_mode <= 1'b0;
        else if ({addr_15, addr_14, addr_13, addr_12} == 4'b0110)
            rom_mode <= gb_data[0];
    end

    // ROM Address Generation
    assign rom_addr = ROM_bank & {9{addr_14}};

    // RAM Address and Chip Select
    assign ram_addr = RAM_bank;
    assign ram_cs_n = ~RAM_enable;

endmodule