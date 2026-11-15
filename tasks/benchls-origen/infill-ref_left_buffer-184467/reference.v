module origen_184467(
    input CLK,
    input RST_n,
    input preset,
    input EN_LEFT,
    input [7:0] REF_DATA,
    output [7:0] REF_LEFT0,
    output [7:0] REF_LEFT1,
    output [7:0] REF_LEFT2,
    output [7:0] REF_LEFT3,
    output [7:0] REF_LEFT4,
    output [7:0] REF_LEFT5,
    output [7:0] REF_LEFT6,
    output [7:0] REF_LEFT7
);

    reg [2:0] count;
    reg [7:0] ref_left[0:7];

    always @(posedge CLK or negedge RST_n) begin
        if (~RST_n) begin
            count <= 3'b0;
            ref_left[0] <= 8'b0;
            ref_left[1] <= 8'b0;
            ref_left[2] <= 8'b0;
            ref_left[3] <= 8'b0;
            ref_left[4] <= 8'b0;
            ref_left[5] <= 8'b0;
            ref_left[6] <= 8'b0;
            ref_left[7] <= 8'b0;
        end
        else if (preset) begin
            count <= 3'b0;
        end
        else if (EN_LEFT) begin
            ref_left[count] <= REF_DATA;
            count <= count + 3'b1;
        end
        else begin
            count <= 3'b0;
        end
    end

    assign REF_LEFT0 = ref_left[0];
    assign REF_LEFT1 = ref_left[1];
    assign REF_LEFT2 = ref_left[2];
    assign REF_LEFT3 = ref_left[3];
    assign REF_LEFT4 = ref_left[4];
    assign REF_LEFT5 = ref_left[5];
    assign REF_LEFT6 = ref_left[6];
    assign REF_LEFT7 = ref_left[7];

endmodule