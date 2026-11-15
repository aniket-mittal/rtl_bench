module origen_002418(
    input gyroclk,
    input gyrowdav,
    input gyrordav,
    input [5:0] gyroaddr,
    input [7:0] gyrowdata,
    output reg wdavgyro,
    output reg rdavgyro,
    output reg [7:0] gyrodata,
    output reg gyrosclk,
    output reg gyrosdi,
    input gyrosdo,
    output reg gyross
);

reg [2:0] gyrostate;
reg [7:0] gyrocadr;
reg [3:0] i;

[MASKED]

always @(negedge gyrordav) begin
    rdavgyro <= 0;
end

always @(negedge gyrowdav) begin
    wdavgyro <= 0;
end

endmodule