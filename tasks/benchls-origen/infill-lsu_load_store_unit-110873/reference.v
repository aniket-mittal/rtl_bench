module origen_110873 (
    input wire [6:0] opcode,
    input wire [2:0] funct3,
    input wire [4:0] rd,
    input wire [31:0] mem_addr,
    input wire [31:0] rs2_data,
    input wire mem_valid,
    input wire data_rvalid,
    input wire [31:0] data_rdata_in,
    
    output reg data_req_o,
    output reg data_we_o,
    output reg [3:0] data_be_o,
    output reg [31:0] data_addr_o,
    output reg [31:0] data_wdata_o,
    output reg [31:0] mem_data_out,
    output reg [4:0] rd_out_lsu,
    output reg rd_write
);

    wire [1:0] add;
    assign add = mem_addr[1:0];

    always @(*) begin
        data_req_o = mem_valid;
        data_addr_o = mem_addr;
        data_we_o = (opcode == 7'b0100011); // S-type store instruction
        rd_out_lsu = rd;
        rd_write = data_rvalid & (opcode == 7'b0000011); // I-type load instruction

        // Default values
        data_be_o = 4'b0000;
        data_wdata_o = 32'b0;
        mem_data_out = 32'b0;

        if (opcode == 7'b0000011) begin // Load operations
            case (funct3)
                3'b000: begin // LB
                    case (add)
                        2'b00: mem_data_out = {{24{data_rdata_in[7]}}, data_rdata_in[7:0]};
                        2'b01: mem_data_out = {{24{data_rdata_in[15]}}, data_rdata_in[15:8]};
                        2'b10: mem_data_out = {{24{data_rdata_in[23]}}, data_rdata_in[23:16]};
                        2'b11: mem_data_out = {{24{data_rdata_in[31]}}, data_rdata_in[31:24]};
                    endcase
                end
                3'b001: begin // LH
                    case (add[1])
                        1'b0: mem_data_out = {{16{data_rdata_in[15]}}, data_rdata_in[15:0]};
                        1'b1: mem_data_out = {{16{data_rdata_in[31]}}, data_rdata_in[31:16]};
                    endcase
                end
                3'b010: begin // LW
                    mem_data_out = data_rdata_in;
                end
                3'b100: begin // LBU
                    case (add)
                        2'b00: mem_data_out = {24'b0, data_rdata_in[7:0]};
                        2'b01: mem_data_out = {24'b0, data_rdata_in[15:8]};
                        2'b10: mem_data_out = {24'b0, data_rdata_in[23:16]};
                        2'b11: mem_data_out = {24'b0, data_rdata_in[31:24]};
                    endcase
                end
                3'b101: begin // LHU
                    case (add[1])
                        1'b0: mem_data_out = {16'b0, data_rdata_in[15:0]};
                        1'b1: mem_data_out = {16'b0, data_rdata_in[31:16]};
                    endcase
                end
            endcase
        end else if (opcode == 7'b0100011) begin // Store operations
            case (funct3)
                3'b000: begin // SB
                    data_wdata_o = {4{rs2_data[7:0]}};
                    case (add)
                        2'b00: data_be_o = 4'b0001;
                        2'b01: data_be_o = 4'b0010;
                        2'b10: data_be_o = 4'b0100;
                        2'b11: data_be_o = 4'b1000;
                    endcase
                end
                3'b001: begin // SH
                    data_wdata_o = {2{rs2_data[15:0]}};
                    case (add[1])
                        1'b0: data_be_o = 4'b0011;
                        1'b1: data_be_o = 4'b1100;
                    endcase
                end
                3'b010: begin // SW
                    data_wdata_o = rs2_data;
                    data_be_o = 4'b1111;
                end
            endcase
        end
    end

endmodule