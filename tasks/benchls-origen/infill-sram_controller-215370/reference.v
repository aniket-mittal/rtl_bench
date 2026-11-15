module origen_215370(
    input clk,
    input rst,
    input read_ce,
    input write_ce,
    input [31:0] write_data,
    input [19:0] addr,
    input [31:0] rom_rdata,
    output reg fin,
    output reg [31:0] rom_wdata,
    output reg [19:0] rom_addr,
    output reg ce,
    output reg we,
    output reg oe,
    output reg [31:0] read_data
);

    reg [2:0] state;
    localparam [2:0]
        prepare = 3'b000,
        r0 = 3'b001, r1 = 3'b010, r2 = 3'b011, r3 = 3'b100, r4 = 3'b101,
        w0 = 3'b001, w1 = 3'b010, w2 = 3'b011, w3 = 3'b100, w4 = 3'b101;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            state <= prepare;
            fin <= 1'b0;
            ce <= 1'b0;
            we <= 1'b0;
            oe <= 1'b0;
            rom_wdata <= 32'hzzzzzzzz;
            read_data <= 32'b0;
            rom_addr <= 20'b0;
        end
        else begin
            case (state)
                prepare: begin
                    fin <= 1'b0;
                    if (read_ce) begin
                        state <= r0;
                        rom_addr <= addr;
                        ce <= 1'b1;
                        oe <= 1'b1;
                        we <= 1'b0;
                    end
                    else if (write_ce) begin
                        state <= w0;
                        rom_addr <= addr;
                        rom_wdata <= write_data;
                        ce <= 1'b1;
                        we <= 1'b1;
                        oe <= 1'b0;
                    end
                    else begin
                        state <= prepare;
                        ce <= 1'b0;
                        we <= 1'b0;
                        oe <= 1'b0;
                        rom_wdata <= 32'hzzzzzzzz;
                    end
                end

                r0: begin
                    state <= r1;
                    read_data <= rom_rdata;
                end
                r1: begin
                    state <= r2;
                end
                r2: begin
                    state <= r3;
                end
                r3: begin
                    state <= r4;
                end
                r4: begin
                    state <= prepare;
                    fin <= 1'b1;
                    ce <= 1'b0;
                    oe <= 1'b0;
                end

                w0: begin
                    state <= w1;
                end
                w1: begin
                    state <= w2;
                end
                w2: begin
                    state <= w3;
                end
                w3: begin
                    state <= w4;
                end
                w4: begin
                    state <= prepare;
                    fin <= 1'b1;
                    ce <= 1'b0;
                    we <= 1'b0;
                    rom_wdata <= 32'hzzzzzzzz;
                end

                default: state <= prepare;
            endcase
        end
    end

endmodule