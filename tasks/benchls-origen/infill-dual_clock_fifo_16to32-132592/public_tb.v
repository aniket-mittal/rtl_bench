// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132592 dut (
    .rdclk(clk),
    .aclr(in_vec[19:19]),
    .data(in_vec[18:3]),
    .rdreq(in_vec[2:2]),
    .wrclk(in_vec[1:1]),
    .wrreq(in_vec[0:0]),
    .q(out_vec[39:8]),
    .rdusedw(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hdece1;
    stim[1] = 20'hc874b;
    stim[2] = 20'h096c4;
    stim[3] = 20'h791cc;
    stim[4] = 20'h66bd8;
    stim[5] = 20'h05a71;
    stim[6] = 20'h07c6e;
    stim[7] = 20'h4f69b;
    stim[8] = 20'h7ba73;
    stim[9] = 20'h7928d;
    stim[10] = 20'h4bea7;
    stim[11] = 20'h5264c;
    stim[12] = 20'h49168;
    stim[13] = 20'h4cdcf;
    stim[14] = 20'h45e58;
    stim[15] = 20'h5a7f9;
    stim[16] = 20'h74b07;
    stim[17] = 20'h65833;
    stim[18] = 20'h8f80e;
    stim[19] = 20'h6c087;
    stim[20] = 20'h55060;
    stim[21] = 20'h64c6f;
    stim[22] = 20'h285d5;
    stim[23] = 20'h706da;
    stim[24] = 20'h1d2dc;
    stim[25] = 20'h4ccbf;
    stim[26] = 20'h23331;
    stim[27] = 20'h4eae8;
    stim[28] = 20'h0f7b4;
    stim[29] = 20'h7eb14;
    stim[30] = 20'h2b199;
    stim[31] = 20'h6d5f8;
    stim[32] = 20'h3cbd0;
    stim[33] = 20'h050f6;
    stim[34] = 20'h5136e;
    stim[35] = 20'h052a8;
    stim[36] = 20'h4da06;
    stim[37] = 20'h1f095;
    stim[38] = 20'h1cc36;
    stim[39] = 20'h6e4ce;
    stim[40] = 20'h6fdad;
    stim[41] = 20'h0847a;
    stim[42] = 20'h07630;
    stim[43] = 20'h3dcd8;
    stim[44] = 20'h37061;
    stim[45] = 20'h22f97;
    stim[46] = 20'h34ef9;
    stim[47] = 20'h5f60b;
    stim[48] = 20'h06782;
    stim[49] = 20'h30d27;
    stim[50] = 20'h412df;
    stim[51] = 20'h04a24;
    stim[52] = 20'h62da7;
    stim[53] = 20'h63781;
    stim[54] = 20'h6f212;
    stim[55] = 20'h81fde;
    stim[56] = 20'h16c2b;
    stim[57] = 20'h04e3a;
    stim[58] = 20'h1c8fa;
    stim[59] = 20'h5d23d;
    stim[60] = 20'h72039;
    stim[61] = 20'h077d2;
    stim[62] = 20'h1713d;
    stim[63] = 20'h0aa36;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000xxxx00;
      expv[4] = 40'hxxxxxxxx00;
      expv[5] = 40'hxxxxxxxx00;
      expv[6] = 40'hxxxxxxxx00;
      expv[7] = 40'hxxxxxxxx00;
      expv[8] = 40'hxxxxxxxx00;
      expv[9] = 40'hxxxxxxxx00;
      expv[10] = 40'hxxxxxxxx00;
      expv[11] = 40'hxxxxxxxx00;
      expv[12] = 40'hxxxxxxxx00;
      expv[13] = 40'hxxxxxxxx00;
      expv[14] = 40'hxxxxxxxx00;
      expv[15] = 40'hxxxxxxxx00;
      expv[16] = 40'hxxxxxxxx00;
      expv[17] = 40'hxxxxxxxx00;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h000097d400;
      expv[21] = 40'h000097d400;
      expv[22] = 40'hc98d97d400;
      expv[23] = 40'hc98d99b900;
      expv[24] = 40'hc98d99b900;
      expv[25] = 40'h99b999b900;
      expv[26] = 40'h99b9e96000;
      expv[27] = 40'h99b9e96000;
      expv[28] = 40'h99b9e96000;
      expv[29] = 40'he960e96000;
      expv[30] = 40'he960xxxx00;
      expv[31] = 40'he960xxxx00;
      expv[32] = 40'he960xxxx00;
      expv[33] = 40'he960xxxx00;
      expv[34] = 40'hxxxxxxxx00;
      expv[35] = 40'hxxxxxxxx00;
      expv[36] = 40'hxxxxxxxx00;
      expv[37] = 40'hxxxxxxxx00;
      expv[38] = 40'hxxxxxxxx00;
      expv[39] = 40'hxxxxxxxx00;
      expv[40] = 40'hxxxxxxxx00;
      expv[41] = 40'hxxxxxxxx00;
      expv[42] = 40'hxxxxxxxx00;
      expv[43] = 40'hxxxxxxxx00;
      expv[44] = 40'hxxxxxxxx00;
      expv[45] = 40'hxxxxxxxx00;
      expv[46] = 40'hxxxxxxxx00;
      expv[47] = 40'hxxxxxxxx01;
      expv[48] = 40'hxxxxxxxx01;
      expv[49] = 40'hxxxxxxxx01;
      expv[50] = 40'hxxxxxxxx01;
      expv[51] = 40'hxxxxxxxx01;
      expv[52] = 40'hxxxxxxxx01;
      expv[53] = 40'hxxxxxxxx01;
      expv[54] = 40'hxxxxxxxx01;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000c98d00;
      expv[61] = 40'h0000c98d00;
      expv[62] = 40'h0000c98d00;
      expv[63] = 40'hc98dc98d00;
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
