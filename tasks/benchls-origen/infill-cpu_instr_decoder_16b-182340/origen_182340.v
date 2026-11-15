module origen_182340(
    input [15:0] ins,
    input is_ban,
    output reg stop,
    output reg [11:0] change_pc,
    output reg [1:0] type_pc,
    output reg acc_we,
    output reg [11:0] ram_add,
    output reg ram_we,
    output reg [3:0] op
);

initial begin
    stop = 0;
    change_pc = 12'b0;
    type_pc = 2'b0;
    acc_we = 0;
    ram_add = 12'b0;
    ram_we = 0;
    op = 4'b1111;
end

[MASKED]

endmodule