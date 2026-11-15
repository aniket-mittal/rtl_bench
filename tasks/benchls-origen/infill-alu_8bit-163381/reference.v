module origen_163381(
    input  [7:0] opd_1,
    input  [7:0] opd_2,
    input  [3:0] opcode,
    output [15:0] res,
    output c_flag,
    output z_flag
);

    parameter ADD   = 4'b0000;
    parameter ADDC  = 4'b0001;
    parameter SUB   = 4'b0010;
    parameter SUBB  = 4'b0011;
    parameter DEC   = 4'b0100;
    parameter INC   = 4'b0101;
    parameter TRAN  = 4'b0110;
    parameter AND   = 4'b0111;
    parameter OR    = 4'b1000;
    parameter XOR   = 4'b1001;
    parameter NOT   = 4'b1010;
    parameter SHL   = 4'b1011;
    parameter SHR   = 4'b1100;

    reg [15:0] result;
    reg c_flag_reg, z_flag_reg;

    always @(*) begin
        case (opcode)
            ADD: begin
                {c_flag_reg, result[7:0]} = opd_1 + opd_2;
                result[15:8] = 8'b0;
            end
            ADDC: begin
                {c_flag_reg, result[7:0]} = opd_1 + opd_2 + c_flag_reg;
                result[15:8] = 8'b0;
            end
            SUB: begin
                {c_flag_reg, result[7:0]} = opd_1 - opd_2;
                result[15:8] = 8'b0;
            end
            SUBB: begin
                {c_flag_reg, result[7:0]} = opd_1 - opd_2 - ~c_flag_reg;
                result[15:8] = 8'b0;
            end
            DEC: begin
                {c_flag_reg, result[7:0]} = opd_1 - 1;
                result[15:8] = 8'b0;
            end
            INC: begin
                {c_flag_reg, result[7:0]} = opd_1 + 1;
                result[15:8] = 8'b0;
            end
            TRAN: begin
                result = {8'b0, opd_1};
                c_flag_reg = 1'b0;
            end
            AND: begin
                result = {8'b0, opd_1 & opd_2};
                c_flag_reg = 1'b0;
            end
            OR: begin
                result = {8'b0, opd_1 | opd_2};
                c_flag_reg = 1'b0;
            end
            XOR: begin
                result = {8'b0, opd_1 ^ opd_2};
                c_flag_reg = 1'b0;
            end
            NOT: begin
                result = {8'b0, ~opd_1};
                c_flag_reg = 1'b0;
            end
            SHL: begin
                result = {opd_1[6:0], 1'b0};
                c_flag_reg = opd_1[7];
            end
            SHR: begin
                result = {1'b0, opd_1[7:1]};
                c_flag_reg = opd_1[0];
            end
            default: begin
                result = 16'b0;
                c_flag_reg = 1'b0;
            end
        endcase

        z_flag_reg = (result == 16'b0);
    end

    assign res = result;
    assign c_flag = c_flag_reg;
    assign z_flag = z_flag_reg;

endmodule