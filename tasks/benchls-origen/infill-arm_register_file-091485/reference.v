module origen_091485 #(
    parameter text_start = 32'h00400000
)(
    input [3:0] rn_num, rm_num, rs_num, rd_num,
    input [31:0] rd_data, pc_in, cpsr_in,
    input rd_we, pc_we, cpsr_we,
    input clk, rst_b, halted,
    output [31:0] rn_data, rm_data, rs_data, pc_out, cpsr_out
);

    reg [31:0] mem [0:15];
    reg [31:0] cpsr;

    assign rn_data = mem[rn_num];
    assign rm_data = mem[rm_num];
    assign rs_data = mem[rs_num];
    assign pc_out = mem[15];
    assign cpsr_out = cpsr;

    integer i;
    always @(posedge clk or negedge rst_b) begin
        if (!rst_b) begin
            for (i = 0; i < 15; i = i + 1) begin
                mem[i] <= 32'b0;
            end
            mem[15] <= text_start;
            cpsr <= 32'b0;
        end else begin
            if (rd_we && rd_num != 4'b1111) begin
                mem[rd_num] <= rd_data;
            end
            if (pc_we) begin
                mem[15] <= pc_in;
            end
            if (cpsr_we) begin
                cpsr <= cpsr_in;
            end
        end
    end

    always @(posedge halted) begin
        ;
        for (i = 0; i < 16; i = i + 1) begin
            ;
        end
        ;

        ;
        for (i = 0; i < 16; i = i + 1) begin
            ;
        end
        ;
    end

endmodule