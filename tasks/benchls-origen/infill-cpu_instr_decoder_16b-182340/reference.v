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

always @(*) begin
    case (ins[15:12])
        4'b0000: begin
            op = 4'b0110;
            acc_we = 1;
            type_pc = 2'b00;
            ram_we = 0;
        end
        4'b0001: begin
            op = 4'b0111;
            acc_we = 1;
            type_pc = 2'b00;
            ram_we = 0;
        end
        4'b0010: begin
            op = 4'b0100;
            acc_we = 1;
            type_pc = 2'b00;
            ram_we = 0;
        end
        4'b0011: begin
            op = 4'b0101;
            acc_we = 1;
            type_pc = 2'b00;
            ram_we = 0;
        end
        4'b0100: begin
            stop = 1;
            op = 4'b1111;
        end
        4'b0101: begin
            op = 4'b0000;
            ram_add = ins[11:0];
            ram_we = 0;
            acc_we = 1;
            type_pc = 2'b00;
        end
        4'b0110: begin
            op = 4'b1000;
            ram_add = ins[11:0];
            ram_we = 1;
            acc_we = 0;
            type_pc = 2'b00;
        end
        4'b0111: begin
            op = 4'b1001;
            ram_add = ins[11:0];
            ram_we = 0;
            acc_we = 1;
            type_pc = 2'b00;
        end
        4'b1000: begin
            op = 4'b1111;
            ram_we = 0;
            acc_we = 0;
            change_pc = ins[11:0];
            type_pc = 2'b01;
        end
        4'b1001: begin
            op = 4'b1111;
            ram_we = 0;
            acc_we = 0;
            change_pc = ins[11:0];
            type_pc = (is_ban == 1) ? 2'b10 : 2'b00;
        end
        default: begin
            op = 4'b1111;
        end
    endcase
end

endmodule