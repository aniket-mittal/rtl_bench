module origen_155923(
    input [3:0] aluCode,
    input signed [31:0] a,
    input signed [31:0] b,
    output reg [31:0] result,
    output reg zero
);

reg [31:0] temp_result;
reg cin, cout;
reg temp_zero;

task full_adder_task(
    input a, b, cin,
    output sum, cout
);
begin
    sum = a ^ b ^ cin;
    cout = (a & b) | (a & cin) | (b & cin);
end
endtask

task adder_task(
    input signed [31:0] a,
    input signed [31:0] b,
    output signed [31:0] sum
);
begin
    temp_result = 0;
    cin = 0;
    for (integer i = 0; i < 32; i = i + 1) begin
        full_adder_task(a[i], b[i], cin, temp_result[i], cout);
        cin = cout;
    end
    sum = temp_result;
end
endtask

task inverter_task(
    input a,
    output inv
);
begin
    inv = ~a;
end
endtask

task subtract_task(
    input signed [31:0] a,
    input signed [31:0] b,
    output signed [31:0] diff
);
begin
    reg [31:0] b_inv;
    for (integer i = 0; i < 32; i = i + 1) begin
        inverter_task(b[i], b_inv[i]);
    end
    adder_task(a, b_inv, diff);
    diff = diff + 1;
end
endtask

task slt_task(
    input signed [31:0] a,
    input signed [31:0] b,
    output reg [31:0] result
);
begin
    reg [31:0] diff;
    subtract_task(a, b, diff);
    result = (diff[31]) ? 1 : 0;
end
endtask

task and_task(
    input signed [31:0] a,
    input signed [31:0] b,
    output reg [31:0] result
);
begin
    for (integer i = 0; i < 32; i = i + 1) begin
        result[i] = a[i] & b[i];
    end
end
endtask

task or_task(
    input signed [31:0] a,
    input signed [31:0] b,
    output reg [31:0] result
);
begin
    for (integer i = 0; i < 32; i = i + 1) begin
        result[i] = a[i] | b[i];
    end
end
endtask

always @(*) begin
    case (aluCode)
        4'b0000: adder_task(a, b, temp_result);
        4'b0001: subtract_task(a, b, temp_result);
        4'b0010: slt_task(a, b, temp_result);
        4'b0011: and_task(a, b, temp_result);
        4'b0100: or_task(a, b, temp_result);
        default: temp_result = 0;
    endcase

    temp_zero = (temp_result == 0);
end

assign result = temp_result;
assign zero = temp_zero;

endmodule