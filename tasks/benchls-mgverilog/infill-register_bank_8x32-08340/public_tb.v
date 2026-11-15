// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 224;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08340 dut (
    .clk(clk),
    .sync(in_vec[38:38]),
    .reset(in_vec[37:37]),
    .write(in_vec[36:36]),
    .writedata(in_vec[35:4]),
    .address(in_vec[3:0]),
    .reg0(out_vec[223:192]),
    .reg1(out_vec[191:160]),
    .reg2(out_vec[159:128]),
    .reg3(out_vec[127:96]),
    .reg4(out_vec[95:64]),
    .reg5(out_vec[63:32]),
    .reg6(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h3b0020b58c;
    stim[1] = 39'h3e60d4a058;
    stim[2] = 39'h4314a70beb;
    stim[3] = 39'h50300cadfe;
    stim[4] = 39'h5d903fb93a;
    stim[5] = 39'h4f672125b1;
    stim[6] = 39'h1e75cc4630;
    stim[7] = 39'h5962418106;
    stim[8] = 39'h5fbb467059;
    stim[9] = 39'h5f981de505;
    stim[10] = 39'h1c55166a5b;
    stim[11] = 39'h001dd86e72;
    stim[12] = 39'h5184b36ab8;
    stim[13] = 39'h5f230f9813;
    stim[14] = 39'h5662013760;
    stim[15] = 39'h1c68a27afa;
    stim[16] = 39'h13c177bebe;
    stim[17] = 39'h46aa13b23a;
    stim[18] = 39'h5f7dd371f5;
    stim[19] = 39'h0a9e94a822;
    stim[20] = 39'h13615c7d8c;
    stim[21] = 39'h109c0cdf21;
    stim[22] = 39'h0e83671a2e;
    stim[23] = 39'h49c202a824;
    stim[24] = 39'h55f1543cd2;
    stim[25] = 39'h0653698a89;
    stim[26] = 39'h023a694840;
    stim[27] = 39'h4ac494c7f1;
    stim[28] = 39'h1c20f3b99e;
    stim[29] = 39'h511b88f2a8;
    stim[30] = 39'h1efd380403;
    stim[31] = 39'h1c3117232f;
    stim[32] = 39'h1d0495c9ae;
    stim[33] = 39'h471a945a8d;
    stim[34] = 39'h03e0d0472d;
    stim[35] = 39'h57d3b08200;
    stim[36] = 39'h56b058ed30;
    stim[37] = 39'h5e65c84955;
    stim[38] = 39'h417100fa87;
    stim[39] = 39'h03a6ff4732;
    stim[40] = 39'h4e4d7d0e98;
    stim[41] = 39'h0eac11aee5;
    stim[42] = 39'h5fb4b3bbe0;
    stim[43] = 39'h03e0286a33;
    stim[44] = 39'h41e0197637;
    stim[45] = 39'h185af77f7e;
    stim[46] = 39'h51b8e0e56e;
    stim[47] = 39'h0cbd26ef16;
    stim[48] = 39'h46adeb9097;
    stim[49] = 39'h0dc01cc2d8;
    stim[50] = 39'h1dc794abc0;
    stim[51] = 39'h5503819ed4;
    stim[52] = 39'h0212e4ee0d;
    stim[53] = 39'h00fdc66a29;
    stim[54] = 39'h113e3387f1;
    stim[55] = 39'h08209fefc0;
    stim[56] = 39'h42874fbc47;
    stim[57] = 39'h153c300911;
    stim[58] = 39'h02b8b42618;
    stim[59] = 39'h57291fbb91;
    stim[60] = 39'h042bde0372;
    stim[61] = 39'h5b3408933f;
    stim[62] = 39'h0c2b8537fd;
    stim[63] = 39'h09f96b1bb2;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[1] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[2] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[3] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[4] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[5] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[6] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[7] = 224'he75cc463000000000000000000000000000000000000000000000000;
      expv[8] = 224'he75cc463000000000000000000000000000000000000000096241810;
      expv[9] = 224'he75cc463000000000000000000000000000000000000000096241810;
      expv[10] = 224'he75cc46300000000000000000000000000000000f981de5096241810;
      expv[11] = 224'he75cc46300000000000000000000000000000000f981de5096241810;
      expv[12] = 224'he75cc46300000000000000000000000000000000f981de5096241810;
      expv[13] = 224'he75cc46300000000000000000000000000000000f981de5096241810;
      expv[14] = 224'he75cc4630000000000000000f230f98100000000f981de5096241810;
      expv[15] = 224'h662013760000000000000000f230f98100000000f981de5096241810;
      expv[16] = 224'h662013760000000000000000f230f98100000000f981de5096241810;
      expv[17] = 224'h662013760000000000000000f230f98100000000f981de5096241810;
      expv[18] = 224'h662013760000000000000000f230f98100000000f981de5096241810;
      expv[19] = 224'h662013760000000000000000f230f98100000000f7dd371f96241810;
      expv[20] = 224'h662013760000000000000000f230f98100000000f7dd371f96241810;
      expv[21] = 224'h662013760000000000000000f230f98100000000f7dd371f96241810;
      expv[22] = 224'h662013760000000000000000f230f98100000000f7dd371f96241810;
      expv[23] = 224'h662013760000000000000000f230f98100000000f7dd371f96241810;
      expv[24] = 224'h6620137609c0cdf200000000f230f98100000000f7dd371f96241810;
      expv[25] = 224'h6620137609c0cdf25f1543cdf230f98100000000f7dd371f96241810;
      expv[26] = 224'h6620137609c0cdf25f1543cdf230f98100000000f7dd371f96241810;
      expv[27] = 224'h6620137609c0cdf25f1543cdf230f98100000000f7dd371f96241810;
      expv[28] = 224'h66201376000000005f1543cdf230f98100000000f7dd371f96241810;
      expv[29] = 224'h66201376000000005f1543cdf230f98100000000f7dd371f96241810;
      expv[30] = 224'h66201376000000005f1543cdf230f98100000000f7dd371f96241810;
      expv[31] = 224'h66201376000000005f1543cdefd3804000000000f7dd371f96241810;
      expv[32] = 224'h66201376000000005f1543cdefd3804000000000f7dd371f96241810;
      expv[33] = 224'h66201376000000005f1543cdefd3804000000000f7dd371f96241810;
      expv[34] = 224'h66201376000000005f1543cdefd3804000000000f7dd371f96241810;
      expv[35] = 224'h66201376000000005f1543cdefd3804000000000f7dd371f96241810;
      expv[36] = 224'h7d3b0820000000005f1543cdefd3804000000000f7dd371f96241810;
      expv[37] = 224'h6b058ed3000000005f1543cdefd3804000000000f7dd371f96241810;
      expv[38] = 224'h6b058ed3000000005f1543cdefd3804000000000e65c849596241810;
      expv[39] = 224'h6b058ed3000000005f1543cdefd3804000000000e65c849596241810;
      expv[40] = 224'h6b058ed3000000005f1543cdefd3804000000000e65c849596241810;
      expv[41] = 224'h6b058ed3000000005f1543cdefd3804000000000e65c849596241810;
      expv[42] = 224'h6b058ed3000000005f1543cdefd3804000000000e65c849596241810;
      expv[43] = 224'hfb4b3bbe000000005f1543cdefd3804000000000e65c849596241810;
      expv[44] = 224'hfb4b3bbe000000005f1543cdefd3804000000000e65c849596241810;
      expv[45] = 224'hfb4b3bbe000000005f1543cdefd3804000000000e65c849596241810;
      expv[46] = 224'hfb4b3bbe000000005f1543cdefd3804000000000e65c849596241810;
      expv[47] = 224'hfb4b3bbe000000005f1543cdefd3804000000000e65c849596241810;
      expv[48] = 224'hfb4b3bbe000000005f1543cdefd3804000000000e65c849596241810;
      expv[49] = 224'hfb4b3bbe000000005f1543cdefd3804000000000e65c849596241810;
      expv[50] = 224'hfb4b3bbe000000005f1543cdefd3804000000000e65c849596241810;
      expv[51] = 224'hdc794abc000000005f1543cdefd3804000000000e65c849596241810;
      expv[52] = 224'hdc794abc000000005f1543cdefd38040503819ede65c849596241810;
      expv[53] = 224'hdc794abc000000005f1543cdefd38040503819ede65c849596241810;
      expv[54] = 224'hdc794abc000000005f1543cdefd38040503819ede65c849596241810;
      expv[55] = 224'hdc794abc000000005f1543cdefd38040503819ede65c849596241810;
      expv[56] = 224'hdc794abc000000005f1543cdefd38040503819ede65c849596241810;
      expv[57] = 224'hdc794abc13e3387f5f1543cdefd38040503819ede65c849596241810;
      expv[58] = 224'hdc794abc13e3387f5f1543cdefd38040503819ede65c849596241810;
      expv[59] = 224'hdc794abc13e3387f5f1543cdefd38040503819ede65c849596241810;
      expv[60] = 224'hdc794abc13e3387f5f1543cdefd38040503819ede65c849596241810;
      expv[61] = 224'hdc794abc13e3387f5f1543cdefd38040503819ede65c849596241810;
      expv[62] = 224'hdc794abc6010c3805f1543cdefd38040503819ede65c849596241810;
      expv[63] = 224'hdc794abc6010c3805f1543cdefd38040503819ede65c849596241810;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
