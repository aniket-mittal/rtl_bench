module origen_137432(
    input [3:0] dividend,
    input [3:0] divisor,
    input A,
    input B,
    input C,
    input D,
    input select,
    output [1:0] Y1,
    output [1:0] Y0
);

    wire [3:0] quotient, remainder;
    wire [1:0] encoder_Y1, encoder_Y0;

    non_restoring_divider nrd (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder)
    );

    priority_encoder pe (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y1(encoder_Y1),
        .Y0(encoder_Y0)
    );

    assign Y1 = select ? quotient[1:0] : encoder_Y1;
    assign Y0 = select ? remainder[1:0] : encoder_Y0;

endmodule

module non_restoring_divider(
    input [3:0] dividend,
    input [3:0] divisor,
    output reg [3:0] quotient,
    output reg [3:0] remainder
);

    reg [7:0] A, M;
    reg [3:0] Q;
    integer i;

    always @(*) begin
        A = {4'b0000, dividend};
        M = {divisor, 4'b0000};
        Q = 4'b0000;

        for (i = 0; i < 4; i = i + 1) begin
            A = {A[6:0], Q[3]};
            if (A[7] == 0) begin
                A = A - M;
            end else begin
                A = A + M;
            end

            Q = {Q[2:0], ~A[7]};
            if (A[7] == 1) begin
                A = A + M;
            end
        end

        if (A[7] == 1) begin
            A = A + M;
        end

        quotient = Q;
        remainder = A[7:4];
    end

endmodule

module priority_encoder(
    input A,
    input B,
    input C,
    input D,
    output reg [1:0] Y1,
    output reg [1:0] Y0
);

    always @(*) begin
        if (A) begin
            Y1 = 2'b00;
            if (B) Y0 = 2'b01;
            else if (C) Y0 = 2'b10;
            else if (D) Y0 = 2'b11;
            else Y0 = 2'b00;
        end
        else if (B) begin
            Y1 = 2'b01;
            if (C) Y0 = 2'b10;
            else if (D) Y0 = 2'b11;
            else Y0 = 2'b00;
        end
        else if (C) begin
            Y1 = 2'b10;
            if (D) Y0 = 2'b11;
            else Y0 = 2'b00;
        end
        else if (D) begin
            Y1 = 2'b11;
            Y0 = 2'b00;
        end
        else begin
            Y1 = 2'b00;
            Y0 = 2'b00;
        end
    end

endmodule