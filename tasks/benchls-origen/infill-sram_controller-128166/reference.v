module origen_128166 #(
    parameter WIDTH = 32,
    parameter DEPTH = 19
)(
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] RAM_D_pi,
    output reg [WIDTH-1:0] RAM_D_po,
    output reg RAM_D_poe,
    output reg [DEPTH-1:0] RAM_A,
    output reg RAM_WEn,
    output reg RAM_CENn,
    output reg RAM_LDn,
    output reg RAM_OEn,
    output reg RAM_CE1n,
    output reg correct
);

reg [18:0] write_count;
reg [18:0] read_count;
reg enable;
reg write;
reg write_cycle;
reg read_cycle;
reg enable_reads;
reg [DEPTH-1:0] address;
reg [WIDTH-1:0] data_out;
wire [WIDTH-1:0] data_in;
wire data_in_valid;
reg [WIDTH-1:0] check_data;
reg [WIDTH-1:0] check_data_old;
reg [WIDTH-1:0] check_data_old2;

assign data_in = RAM_D_pi;
assign data_in_valid = ~RAM_OEn & ~RAM_CENn;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        write_count <= 19'b0;
        read_count <= 19'b0;
        enable <= 1'b0;
        write <= 1'b1;
        write_cycle <= 1'b1;
        read_cycle <= 1'b0;
        enable_reads <= 1'b0;
        address <= {DEPTH{1'b0}};
        data_out <= {WIDTH{1'b0}};
        check_data <= {WIDTH{1'b0}};
        check_data_old <= {WIDTH{1'b0}};
        check_data_old2 <= {WIDTH{1'b0}};
        correct <= 1'b1;
        RAM_D_po <= {WIDTH{1'b0}};
        RAM_D_poe <= 1'b0;
        RAM_A <= {DEPTH{1'b0}};
        RAM_WEn <= 1'b1;
        RAM_CENn <= 1'b1;
        RAM_LDn <= 1'b1;
        RAM_OEn <= 1'b1;
        RAM_CE1n <= 1'b1;
    end else begin
        if (enable) begin
            if (write_cycle) begin
                write_count <= write_count + 1;
                address <= write_count[18:0];
                data_out <= write_count[17:0];
                RAM_A <= write_count[18:0];
                RAM_D_po <= write_count[17:0];
                RAM_D_poe <= 1'b1;
                RAM_WEn <= 1'b0;
                RAM_CENn <= 1'b0;
                RAM_LDn <= 1'b0;
                RAM_OEn <= 1'b1;
                RAM_CE1n <= 1'b0;
                write_cycle <= 1'b0;
                read_cycle <= 1'b1;
            end else if (read_cycle) begin
                if (enable_reads) begin
                    read_count <= read_count + 1;
                    address <= read_count[18:0];
                    RAM_A <= read_count[18:0];
                    RAM_D_poe <= 1'b0;
                    RAM_WEn <= 1'b1;
                    RAM_CENn <= 1'b0;
                    RAM_LDn <= 1'b1;
                    RAM_OEn <= 1'b0;
                    RAM_CE1n <= 1'b0;
                    check_data <= read_count[17:0];
                    check_data_old <= check_data;
                    check_data_old2 <= check_data_old;
                    if (data_in_valid) begin
                        if (data_in != check_data_old2) begin
                            correct <= 1'b0;
                        end
                    end
                end
                write_cycle <= 1'b1;
                read_cycle <= 1'b0;
            end
            
            if (write_count[3:0] == 4'b1111) begin
                enable_reads <= 1'b1;
            end
        end else begin
            enable <= 1'b1;
        end
    end
end

endmodule