module origen_066717 (
    output O,
    output OB,
    input I,
    input IB,
    input IBUFDISABLE
);

    parameter DIFF_TERM = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";
    parameter LOC = "UNPLACED";
    parameter USE_IBUFDISABLE = "TRUE";

    reg o_out;
    wire o_out_int, ob_out_int;

    initial begin
        if ((DIFF_TERM != "TRUE") && (DIFF_TERM != "FALSE")) begin
            $display("Attribute Syntax Error : The attribute DIFF_TERM on X_IBUFDS_DIFF_OUT_IBUFDISABLE instance %m is set to %s. Legal values for this attribute are TRUE or FALSE.", DIFF_TERM);
            ;
        end

        if ((IBUF_LOW_PWR != "TRUE") && (IBUF_LOW_PWR != "FALSE")) begin
            $display("Attribute Syntax Error : The attribute IBUF_LOW_PWR on X_IBUFDS_DIFF_OUT_IBUFDISABLE instance %m is set to %s. Legal values for this attribute are TRUE or FALSE.", IBUF_LOW_PWR);
            ;
        end
    end

    [MASKED]

    assign o_out_int = (USE_IBUFDISABLE == "TRUE") ? 
                       ((IBUFDISABLE === 1'b0) ? o_out :
                        (IBUFDISABLE === 1'b1) ? 1'b1 : 1'bx) : o_out;

    assign ob_out_int = (USE_IBUFDISABLE == "TRUE") ? 
                        ((IBUFDISABLE === 1'b0) ? ~o_out :
                         (IBUFDISABLE === 1'b1) ? 1'b1 : 1'bx) : ~o_out;

    assign O = o_out_int;
    assign OB = ob_out_int;

    specify
        (I => O) = (0:0:0, 0:0:0);
        (I => OB) = (0:0:0, 0:0:0);
        (IB => O) = (0:0:0, 0:0:0);
        (IB => OB) = (0:0:0, 0:0:0);
        (IBUFDISABLE => O) = (0:0:0, 0:0:0);
        (IBUFDISABLE => OB) = (0:0:0, 0:0:0);
    endspecify

endmodule