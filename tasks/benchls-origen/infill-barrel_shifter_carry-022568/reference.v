module origen_022568 (
    input [4:0] a,
    input [31:0] b,
    input [1:0] aluc,
    output [31:0] r,
    output carry
);

    reg [31:0] temp;
    reg carry_temp;

    always @(*) begin
        temp = b;
        carry_temp = 1'bx;

        case (aluc)
            2'b00: begin // Arithmetic right shift
                if (a != 5'b0) begin
                    if (a[0]) temp = {{1{temp[31]}}, temp[31:1]};
                    if (a[1]) temp = {{2{temp[31]}}, temp[31:2]};
                    if (a[2]) temp = {{4{temp[31]}}, temp[31:4]};
                    if (a[3]) temp = {{8{temp[31]}}, temp[31:8]};
                    if (a[4]) temp = {{16{temp[31]}}, temp[31:16]};
                    carry_temp = b[a-1];
                end
            end
            2'b01: begin // Logical right shift
                if (a != 5'b0) begin
                    if (a[0]) temp = {1'b0, temp[31:1]};
                    if (a[1]) temp = {2'b0, temp[31:2]};
                    if (a[2]) temp = {4'b0, temp[31:4]};
                    if (a[3]) temp = {8'b0, temp[31:8]};
                    if (a[4]) temp = {16'b0, temp[31:16]};
                    carry_temp = b[a-1];
                end
            end
            2'b10, 2'b11: begin // Left shift
                if (a != 5'b0) begin
                    if (a[0]) temp = {temp[30:0], 1'b0};
                    if (a[1]) temp = {temp[29:0], 2'b0};
                    if (a[2]) temp = {temp[27:0], 4'b0};
                    if (a[3]) temp = {temp[23:0], 8'b0};
                    if (a[4]) temp = {temp[15:0], 16'b0};
                    carry_temp = b[32-a];
                end
            end
        endcase
    end

    assign r = temp;
    assign carry = carry_temp;

endmodule