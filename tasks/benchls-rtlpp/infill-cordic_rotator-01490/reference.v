module rtlpp_01490(
    input wire i_clk, 
    input wire i_reset, 
    input wire i_ce, 
    input wire signed [15:0] i_xval, 
    input wire signed [15:0] i_yval, 
    input wire [24:0] i_phase, 
    input wire i_aux,
    output reg signed [15:0] o_xval, 
    output reg signed [15:0] o_yval, 
    output reg o_aux
);
    localparam IW = 16, 
               OW = 16, 
               NSTAGES = 21,
               WW = 21, 
               PW = 25;

    wire signed [20:0] e_xval, e_yval;
    
    assign e_xval = { {i_xval[15]}, i_xval, 4'b0 };
    assign e_yval = { {i_yval[15]}, i_yval, 4'b0 };

    reg signed [20:0] xv [0:NSTAGES];
    reg signed [20:0] yv [0:NSTAGES];
    reg [24:0] ph [0:NSTAGES];
    reg [NSTAGES:0] ax;

    always @(posedge i_clk) begin
        if (i_reset)
            ax <= {(NSTAGES+1){1'b0}};
        else if (i_ce)
            ax <= { ax[NSTAGES-1:0], i_aux };
    end

    always @(posedge i_clk) begin
        if (i_reset) begin
            xv[0] <= 0;
            yv[0] <= 0;
            ph[0] <= 0;
        end else if (i_ce) begin
            case (i_phase[24:22])
            3'b000: begin
                xv[0] <= e_xval;
                yv[0] <= e_yval;
                ph[0] <= i_phase;
            end
            3'b001, 3'b010: begin
                xv[0] <= -e_yval;
                yv[0] <= e_xval;
                ph[0] <= i_phase - 25'h800000;
            end
            3'b011, 3'b100: begin
                xv[0] <= -e_xval;
                yv[0] <= -e_yval;
                ph[0] <= i_phase - 25'h1000000;
            end
            3'b101, 3'b110: begin
                xv[0] <= e_yval;
                yv[0] <= -e_xval;
                ph[0] <= i_phase - 25'h1800000;
            end
            3'b111: begin
                xv[0] <= e_xval;
                yv[0] <= e_yval;
                ph[0] <= i_phase;
            end
            endcase
        end
    end

    wire [24:0] cordic_angle [0:NSTAGES-1];

    assign cordic_angle[0] = 25'h025c80a; 
    assign cordic_angle[1] = 25'h013f670; 
    assign cordic_angle[2] = 25'h00a2223; 
    assign cordic_angle[3] = 25'h005161a; 
    assign cordic_angle[4] = 25'h0028baf; 
    assign cordic_angle[5] = 25'h00145ec; 
    assign cordic_angle[6] = 25'h000a2f8; 
    assign cordic_angle[7] = 25'h000517c; 
    assign cordic_angle[8] = 25'h00028be; 
    assign cordic_angle[9] = 25'h000145f; 
    assign cordic_angle[10] = 25'h0000a2f; 
    assign cordic_angle[11] = 25'h0000517; 
    assign cordic_angle[12] = 25'h000028b; 
    assign cordic_angle[13] = 25'h0000145; 
    assign cordic_angle[14] = 25'h00000a2; 
    assign cordic_angle[15] = 25'h0000051; 
    assign cordic_angle[16] = 25'h0000028; 
    assign cordic_angle[17] = 25'h0000014; 
    assign cordic_angle[18] = 25'h000000a; 
    assign cordic_angle[19] = 25'h0000005; 
    assign cordic_angle[20] = 25'h0000002; 

    genvar i;
    generate 
        for(i = 0; i < NSTAGES; i = i + 1) begin : CORDICops
            always @(posedge i_clk) begin
                if (i_reset) begin
                    xv[i + 1] <= 0;
                    yv[i + 1] <= 0;
                    ph[i + 1] <= 0;
                end else if (i_ce) begin
                    if ((cordic_angle[i] == 0)||(i >= WW)) begin
                        xv[i + 1] <= xv[i];
                        yv[i + 1] <= yv[i];
                        ph[i + 1] <= ph[i];
                    end else if (ph[i][24]) begin
                        xv[i + 1] <= xv[i] + (yv[i] >> (i + 1));
                        yv[i + 1] <= yv[i] - (xv[i] >> (i + 1));
                        ph[i + 1] <= ph[i] + cordic_angle[i];
                    end else begin
                        xv[i + 1] <= xv[i] - (yv[i] >> (i + 1));
                        yv[i + 1] <= yv[i] + (xv[i] >> (i + 1));
                        ph[i + 1] <= ph[i] - cordic_angle[i];
                    end
                end
            end
        end
    endgenerate

    wire [20:0] pre_xval, pre_yval;

    assign pre_xval = xv[NSTAGES] + { {OW{1'b0}}, xv[NSTAGES][WW-OW], {WW-OW-1{!xv[NSTAGES][WW-OW]}} };
    assign pre_yval = yv[NSTAGES] + { {OW{1'b0}}, yv[NSTAGES][WW-OW], {WW-OW-1{!yv[NSTAGES][WW-OW]}} };

    always @(posedge i_clk) begin
        o_xval <= pre_xval[WW-1:WW-OW];
        o_yval <= pre_yval[WW-1:WW-OW];
        o_aux <= ax[NSTAGES];
    end

    wire [(2*(WW-OW)-1):0] unused_val;
    assign unused_val = { pre_xval[WW-OW-1:0], pre_yval[WW-OW-1:0] };

endmodule