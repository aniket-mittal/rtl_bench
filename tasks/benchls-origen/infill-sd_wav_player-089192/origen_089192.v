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

    [MASKED]

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