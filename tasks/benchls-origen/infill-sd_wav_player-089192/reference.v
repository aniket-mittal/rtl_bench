module origen_089192 #(
    parameter SADDR = 32'h0,
    parameter OADDR = 32'h1000000
) (
    input wire clk_50M,
    input wire SD_clk,
    input wire init,
    input wire data_come,
    input wire [7:0] mydata,
    input wire myvalid,
    input wire wav_rden,
    output reg [15:0] wav_data,
    output reg read_SD
);

    reg [31:0] read_sec;
    reg [12:0] ram_addr;
    reg [12:0] ram_raddr;
    reg [7:0] myram [0:8191];
    reg [23:0] counter;
    reg read_req;
    reg next_read;
    reg next_read_reg, next_read_reg_r1, next_read_reg_r2;

    // State machine
    reg [2:0] state;
    localparam IDLE = 3'd0, READ_SD = 3'd1, WRITE_RAM = 3'd2, READ_WAV = 3'd3;

    always @(posedge clk_50M) begin
        if (!init) begin
            state <= IDLE;
            read_sec <= SADDR;
            ram_addr <= 13'd0;
            ram_raddr <= 13'd0;
            counter <= 24'd0;
            read_req <= 1'b0;
            next_read <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (counter == 24'd1022) begin
                        state <= READ_SD;
                        read_req <= 1'b1;
                    end else begin
                        counter <= counter + 1'b1;
                    end
                end

                READ_SD: begin
                    if (data_come) begin
                        state <= WRITE_RAM;
                        read_req <= 1'b0;
                    end
                end

                WRITE_RAM: begin
                    if (ram_addr == 13'd8191) begin
                        state <= READ_WAV;
                        next_read <= 1'b1;
                    end else if (myvalid) begin
                        ram_addr <= ram_addr + 1'b1;
                    end
                end

                READ_WAV: begin
                    if (wav_rden) begin
                        ram_raddr <= ram_raddr + 2'd2;
                        if (ram_raddr >= 13'd8190) begin
                            state <= READ_SD;
                            read_req <= 1'b1;
                            next_read <= 1'b0;
                        end
                    end
                end
            endcase

            if (read_sec >= OADDR) begin
                read_sec <= SADDR;
            end else if (next_read) begin
                read_sec <= read_sec + 32'h200;
            end
        end
    end

    // RAM write operation
    always @(posedge SD_clk) begin
        if (myvalid) begin
            myram[ram_addr] <= mydata;
        end
    end

    // WAV data read operation
    always @(posedge clk_50M) begin
        if (wav_rden) begin
            wav_data <= {myram[ram_raddr+1], myram[ram_raddr]};
        end
    end

    // Clock domain crossing
    always @(posedge SD_clk) begin
        next_read_reg <= next_read;
        next_read_reg_r1 <= next_read_reg;
        next_read_reg_r2 <= next_read_reg_r1;
    end

    // Read SD control
    always @(*) begin
        read_SD = read_req | next_read_reg_r2;
    end

endmodule