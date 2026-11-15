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

always @(posedge gyroclk) begin
    case (gyrostate)
        0: begin
            gyross <= 1;
            gyrosclk <= 0;
            if (gyrordav && !rdavgyro) begin
                gyrocadr <= {2'b10, gyroaddr};
                gyrostate <= 1;
                i <= 0;
                gyross <= 0;
            end else if (gyrowdav && !wdavgyro) begin
                gyrocadr <= {2'b00, gyroaddr};
                gyrostate <= 1;
                i <= 0;
                gyross <= 0;
            end
        end
        1: begin
            gyrosdi <= gyrocadr[7-i];
            gyrostate <= 2;
        end
        2: begin
            gyrosclk <= 1;
            if (i == 7) begin
                gyrostate <= 3;
                i <= 0;
            end else begin
                i <= i + 1;
                gyrostate <= 1;
            end
        end
        3: begin
            gyrosclk <= 0;
            if (gyrocadr[7:6] == 2'b10) begin
                gyrodata[7-i] <= gyrosdo;
            end else begin
                gyrosdi <= gyrowdata[7-i];
            end
            gyrostate <= 4;
        end
        4: begin
            gyrosclk <= 1;
            if (i == 7) begin
                gyrostate <= 5;
            end else begin
                i <= i + 1;
                gyrostate <= 3;
            end
        end
        5: begin
            gyross <= 1;
            if (gyrocadr[7:6] == 2'b10) begin
                rdavgyro <= 1;
            end else begin
                wdavgyro <= 1;
            end
            gyrostate <= 0;
        end
        default: gyrostate <= 0;
    endcase
end

always @(negedge gyrordav) begin
    rdavgyro <= 0;
end

always @(negedge gyrowdav) begin
    wdavgyro <= 0;
end

endmodule