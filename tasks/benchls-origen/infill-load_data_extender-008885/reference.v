module origen_008885 (
    input [31:0] m_addr,
    input [31:0] d_f_mem,
    input [36:0] inst_decode,
    output reg [31:0] mem_out
);

    wire i_lb  = inst_decode[0];
    wire i_lh  = inst_decode[1];
    wire i_lw  = inst_decode[2];
    wire i_lbu = inst_decode[3];
    wire i_lhu = inst_decode[4];

    always @(*) begin
        if (i_lw) begin
            mem_out = d_f_mem;
        end
        else if (i_lbu) begin
            case (m_addr[1:0])
                2'b00: mem_out = {24'b0, d_f_mem[7:0]};
                2'b01: mem_out = {24'b0, d_f_mem[15:8]};
                2'b10: mem_out = {24'b0, d_f_mem[23:16]};
                2'b11: mem_out = {24'b0, d_f_mem[31:24]};
            endcase
        end
        else if (i_lb) begin
            case (m_addr[1:0])
                2'b00: mem_out = {{24{d_f_mem[7]}}, d_f_mem[7:0]};
                2'b01: mem_out = {{24{d_f_mem[15]}}, d_f_mem[15:8]};
                2'b10: mem_out = {{24{d_f_mem[23]}}, d_f_mem[23:16]};
                2'b11: mem_out = {{24{d_f_mem[31]}}, d_f_mem[31:24]};
            endcase
        end
        else if (i_lhu) begin
            case (m_addr[1])
                1'b0: mem_out = {16'b0, d_f_mem[15:0]};
                1'b1: mem_out = {16'b0, d_f_mem[31:16]};
            endcase
        end
        else if (i_lh) begin
            case (m_addr[1])
                1'b0: mem_out = {{16{d_f_mem[15]}}, d_f_mem[15:0]};
                1'b1: mem_out = {{16{d_f_mem[31]}}, d_f_mem[31:16]};
            endcase
        end
        else begin
            mem_out = 32'b0;
        end
    end

endmodule