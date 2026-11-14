module origen_017885 (
    input wire SWSTAT,
    input wire WDSRVC,
    input wire FWOVR,
    output reg WDFAIL,
    output reg [2:0] FLSTAT
);

reg SRVC_LMT;

initial begin
    WDFAIL = 1'b0;
    FLSTAT = 3'b000;
    SRVC_LMT = 1'b1;
end

always @(posedge FWOVR or negedge SWSTAT) begin
    if (FWOVR) begin
        WDFAIL <= 1'b1;
        FLSTAT <= 3'b001;
    end
    else if (SRVC_LMT == 1'b0 && FLSTAT != 3'b001) begin
        WDFAIL <= 1'b1;
        FLSTAT <= 3'b100;
    end
    else if (SRVC_LMT == 1'b0 && FLSTAT == 3'b001) begin
        WDFAIL <= 1'b1;
        FLSTAT <= 3'b001;
    end
    else begin
        SRVC_LMT <= 1'b0;
        WDFAIL <= 1'b0;
        FLSTAT <= 3'b000;
    end
end

always @(posedge WDSRVC) begin
    if (WDSRVC && !SWSTAT) begin
        WDFAIL <= 1'b1;
        FLSTAT <= 3'b010;
    end
    else if (WDSRVC && SWSTAT && SRVC_LMT == 1'b0) begin
        SRVC_LMT <= 1'b1;
        WDFAIL <= 1'b0;
        FLSTAT <= 3'b000;
    end
    else if (WDSRVC && SWSTAT && SRVC_LMT == 1'b1) begin
        WDFAIL <= 1'b1;
        FLSTAT <= 3'b011;
    end
end

endmodule