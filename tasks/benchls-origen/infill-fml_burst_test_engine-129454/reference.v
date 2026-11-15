module origen_129454 #(
    parameter csr_addr = 4'h0,
    parameter fml_depth = 20
) (
    input wire sys_clk,
    input wire sys_rst,
    input wire [13:0] csr_a,
    input wire csr_we,
    input wire [31:0] csr_di,
    input wire fml_ack,
    input wire [255:0] fml_di,
    output reg [31:0] csr_do,
    output reg [fml_depth-1:0] fml_adr,
    output reg fml_stb,
    output reg fml_we,
    output reg [31:0] fml_sel,
    output reg [255:0] fml_do
);

// Configuration registers
reg [31:0] burst_count;
reg [fml_depth-1:0] start_address;
reg write_mode;
reg start_test;
reg [31:0] error_count;

// LFSRs
reg [63:0] data_lfsr;
reg [19:0] addr_lfsr;

// State machine
reg [2:0] state;
localparam IDLE = 3'd0, WRITE = 3'd1, READ = 3'd2, COMPARE = 3'd3;

// Counter
reg [31:0] burst_counter;

// Configuration interface
always @(posedge sys_clk) begin
    if (sys_rst) begin
        burst_count <= 32'd0;
        start_address <= {fml_depth{1'b0}};
        write_mode <= 1'b0;
        start_test <= 1'b0;
    end else if (csr_we && csr_a[13:10] == csr_addr) begin
        case (csr_a[1:0])
            2'b00: burst_count <= csr_di;
            2'b01: start_address <= csr_di[fml_depth-1:0];
            2'b10: {start_test, write_mode} <= csr_di[1:0];
            2'b11: error_count <= 32'd0;
        endcase
    end
end

always @(*) begin
    case (csr_a[1:0])
        2'b00: csr_do = burst_count;
        2'b01: csr_do = {{32-fml_depth{1'b0}}, start_address};
        2'b10: csr_do = {30'b0, write_mode, start_test};
        2'b11: csr_do = error_count;
        default: csr_do = 32'd0;
    endcase
end

// LFSRs
always @(posedge sys_clk) begin
    if (sys_rst) begin
        data_lfsr <= 64'hFFFFFFFFFFFFFFFF;
        addr_lfsr <= 20'hFFFFF;
    end else begin
        data_lfsr <= {data_lfsr[62:0], data_lfsr[63] ^ data_lfsr[62] ^ data_lfsr[60] ^ data_lfsr[59]};
        addr_lfsr <= {addr_lfsr[18:0], addr_lfsr[19] ^ addr_lfsr[16]};
    end
end

// State machine
always @(posedge sys_clk) begin
    if (sys_rst) begin
        state <= IDLE;
        burst_counter <= 32'd0;
        fml_adr <= {fml_depth{1'b0}};
        fml_stb <= 1'b0;
        fml_we <= 1'b0;
        fml_sel <= 32'hFFFFFFFF;
        fml_do <= 256'd0;
        error_count <= 32'd0;
    end else begin
        case (state)
            IDLE: begin
                if (start_test) begin
                    state <= write_mode ? WRITE : READ;
                    burst_counter <= burst_count;
                    fml_adr <= start_address;
                end
            end
            WRITE: begin
                fml_stb <= 1'b1;
                fml_we <= 1'b1;
                fml_do <= {data_lfsr, data_lfsr, data_lfsr, data_lfsr};
                if (fml_ack) begin
                    burst_counter <= burst_counter - 1;
                    fml_adr <= fml_adr + 1;
                    if (burst_counter == 1) begin
                        state <= IDLE;
                        fml_stb <= 1'b0;
                        fml_we <= 1'b0;
                    end
                end
            end
            READ: begin
                fml_stb <= 1'b1;
                fml_we <= 1'b0;
                if (fml_ack) begin
                    state <= COMPARE;
                end
            end
            COMPARE: begin
                if (fml_di != {data_lfsr, data_lfsr, data_lfsr, data_lfsr}) begin
                    error_count <= error_count + 1;
                end
                burst_counter <= burst_counter - 1;
                fml_adr <= fml_adr + 1;
                if (burst_counter == 1) begin
                    state <= IDLE;
                    fml_stb <= 1'b0;
                end else begin
                    state <= READ;
                end
            end
        endcase
    end
end

endmodule