module origen_035403 (
    input wire HCLK,
    input wire HRESETn,
    input wire REQ_ICODE,
    input wire REQ_DCODE,
    input wire HREADY_Outputstage_ITCM,
    input wire HSEL_Outputstage_ITCM,
    input wire [1:0] HTRANS_Outputstage_ITCM,
    input wire [2:0] HBURST_Outputstage_ITCM,
    output reg [1:0] PORT_SEL_ARBITER_ITCM,
    output reg PORT_NOSEL_ARBITER_ITCM
);

    reg noport, selport;

    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            PORT_SEL_ARBITER_ITCM <= 2'b00;
            PORT_NOSEL_ARBITER_ITCM <= 1'b1;
            noport <= 1'b1;
            selport <= 1'b0;
        end else if (HREADY_Outputstage_ITCM) begin
            if (REQ_DCODE) begin
                PORT_SEL_ARBITER_ITCM <= 2'b01;
                PORT_NOSEL_ARBITER_ITCM <= 1'b0;
                noport <= 1'b0;
                selport <= 1'b1;
            end else if (REQ_ICODE) begin
                PORT_SEL_ARBITER_ITCM <= 2'b10;
                PORT_NOSEL_ARBITER_ITCM <= 1'b0;
                noport <= 1'b0;
                selport <= 1'b1;
            end else begin
                PORT_SEL_ARBITER_ITCM <= 2'b00;
                PORT_NOSEL_ARBITER_ITCM <= 1'b1;
                noport <= 1'b1;
                selport <= 1'b0;
            end
        end
    end

    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            noport <= 1'b1;
            selport <= 1'b0;
        end else if (HREADY_Outputstage_ITCM) begin
            noport <= ~(REQ_ICODE | REQ_DCODE) & ~HSEL_Outputstage_ITCM;
            selport <= (REQ_ICODE | REQ_DCODE) & HSEL_Outputstage_ITCM &
                       (HTRANS_Outputstage_ITCM != 2'b00);
        end
    end

endmodule