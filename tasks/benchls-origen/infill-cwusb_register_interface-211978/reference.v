module origen_211978 #(
    parameter pBYTECNT_SIZE = 4
)(
    input cwusb_clk,
    input [7:0] cwusb_din,
    input [7:0] cwusb_addr,
    input cwusb_rdn,
    input cwusb_wrn,
    input cwusb_cen,
    input I_drive_data,
    input [7:0] reg_datai,
    output [7:0] cwusb_dout,
    output cwusb_isout,
    output [7:0] reg_address,
    output [pBYTECNT_SIZE-1:0] reg_bytecnt,
    output [7:0] reg_datao,
    output reg_read,
    output reg_write,
    output reg_addrvalid
);

    reg rdflag;
    reg isoutreg;
    reg isoutregdly;
    reg cwusb_wrn_rs;
    reg reg_write_dly;

    always @(posedge cwusb_clk) begin
        rdflag <= ~cwusb_wrn & cwusb_rdn & cwusb_cen;
        isoutreg <= rdflag;
        isoutregdly <= isoutreg;
        cwusb_wrn_rs <= cwusb_wrn;
        reg_write_dly <= reg_write;
    end

    assign cwusb_isout = isoutregdly;
    assign reg_address = cwusb_addr;
    assign reg_datao = cwusb_din;

    reg [pBYTECNT_SIZE-1:0] reg_bytecnt_reg;
    always @(posedge cwusb_clk) begin
        if (reg_write | reg_read) begin
            reg_bytecnt_reg <= reg_bytecnt_reg + 1'b1;
        end else if (cwusb_addr != reg_address) begin
            reg_bytecnt_reg <= 0;
        end
    end
    assign reg_bytecnt = reg_bytecnt_reg;

    assign reg_read = rdflag;
    assign reg_write = ~cwusb_wrn_rs & cwusb_wrn & cwusb_cen;
    assign reg_addrvalid = 1'b1;

    assign cwusb_dout = reg_datai;
endmodule