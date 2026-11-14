module origen_220933(
    input           clk,
    input           rst,
    input           mfc0,
    input           mtc0,
    input [31:0]    pc,
    input [4:0]     Rd,
    input [31:0]    wdata,
    input           exception,
    input           eret,
    input [4:0]     cause,
    input           intr,
    output [31:0]   rdata,
    output [31:0]   status,
    output          timer_int,
    output [31:0]   exc_addr
);

    reg [31:0] reg_file [0:31];

    initial begin
        reg_file[12] = 32'hf;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_file[12] <= 32'hf;
            for (integer i = 0; i < 32; i = i + 1) begin
                if (i != 12) begin
                    reg_file[i] <= 0;
                end
            end
        end
        else begin
            if (mtc0) begin
                reg_file[Rd] <= wdata;
            end
            if (exception && reg_file[12][0]) begin
                reg_file[14] <= pc;
                reg_file[12][0] <= 0;
            end
            if (eret) begin
                reg_file[12][0] <= 1;
            end
        end
    end

    assign rdata = reg_file[Rd];
    assign status = reg_file[12];
    assign timer_int = reg_file[12][1];
    assign exc_addr = (exception && reg_file[12][0]) ? 32'h00400004 : 32'b0;

endmodule