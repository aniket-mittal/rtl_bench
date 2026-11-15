// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07133 dut (
    .CLK(clk),
    .W_OUT_REG(in_vec[32:32]),
    .DIN(in_vec[31:0]),
    .OUT_REG(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h035bd4635;
    stim[1] = 33'h15e10d295;
    stim[2] = 33'h1a16989b9;
    stim[3] = 33'h134be9b43;
    stim[4] = 33'h0e7f53c95;
    stim[5] = 33'h16b1c8dbe;
    stim[6] = 33'h02681fcee;
    stim[7] = 33'h142ddc525;
    stim[8] = 33'h011082384;
    stim[9] = 33'h184841634;
    stim[10] = 33'h1756540a7;
    stim[11] = 33'h1cf6bc833;
    stim[12] = 33'h09212019d;
    stim[13] = 33'h06edd3a28;
    stim[14] = 33'h06fda545f;
    stim[15] = 33'h115c30132;
    stim[16] = 33'h0ce32d2a1;
    stim[17] = 33'h0834157fc;
    stim[18] = 33'h15d471fd9;
    stim[19] = 33'h1d707137a;
    stim[20] = 33'h1186089d7;
    stim[21] = 33'h0bc4492da;
    stim[22] = 33'h026ee7a67;
    stim[23] = 33'h113df6072;
    stim[24] = 33'h06ce33604;
    stim[25] = 33'h04f86cc90;
    stim[26] = 33'h1d41b5652;
    stim[27] = 33'h0c1e94404;
    stim[28] = 33'h00cf87d52;
    stim[29] = 33'h12391625f;
    stim[30] = 33'h05453a4da;
    stim[31] = 33'h19aaadfbb;
    stim[32] = 33'h070148c3b;
    stim[33] = 33'h0a2ad5f61;
    stim[34] = 33'h0ef2c8232;
    stim[35] = 33'h01418bf1a;
    stim[36] = 33'h18e935fe1;
    stim[37] = 33'h04b78a496;
    stim[38] = 33'h0bacdcaa2;
    stim[39] = 33'h1d809bcc4;
    stim[40] = 33'h053a7ccb0;
    stim[41] = 33'h0297557a1;
    stim[42] = 33'h1e4d6a2df;
    stim[43] = 33'h18f35889c;
    stim[44] = 33'h12ce3cd6e;
    stim[45] = 33'h08773aec6;
    stim[46] = 33'h11ca3d611;
    stim[47] = 33'h114e1a210;
    stim[48] = 33'h129367e9b;
    stim[49] = 33'h1076294dc;
    stim[50] = 33'h1ac8b134e;
    stim[51] = 33'h1430d0964;
    stim[52] = 33'h1f42df8ea;
    stim[53] = 33'h0fff2a846;
    stim[54] = 33'h04bf86a86;
    stim[55] = 33'h1069991d2;
    stim[56] = 33'h0239ae9b4;
    stim[57] = 33'h1665b8abb;
    stim[58] = 33'h1a35a6ec2;
    stim[59] = 33'h151cf04de;
    stim[60] = 33'h14da57066;
    stim[61] = 33'h134da8bfa;
    stim[62] = 33'h0749ac92e;
    stim[63] = 33'h1d860714b;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'h95;
      expv[3] = 8'hb9;
      expv[4] = 8'h43;
      expv[5] = 8'h43;
      expv[6] = 8'hbe;
      expv[7] = 8'hbe;
      expv[8] = 8'h25;
      expv[9] = 8'h25;
      expv[10] = 8'h34;
      expv[11] = 8'ha7;
      expv[12] = 8'h33;
      expv[13] = 8'h33;
      expv[14] = 8'h33;
      expv[15] = 8'h33;
      expv[16] = 8'h32;
      expv[17] = 8'h32;
      expv[18] = 8'h32;
      expv[19] = 8'hd9;
      expv[20] = 8'h7a;
      expv[21] = 8'hd7;
      expv[22] = 8'hd7;
      expv[23] = 8'hd7;
      expv[24] = 8'h72;
      expv[25] = 8'h72;
      expv[26] = 8'h72;
      expv[27] = 8'h52;
      expv[28] = 8'h52;
      expv[29] = 8'h52;
      expv[30] = 8'h5f;
      expv[31] = 8'h5f;
      expv[32] = 8'hbb;
      expv[33] = 8'hbb;
      expv[34] = 8'hbb;
      expv[35] = 8'hbb;
      expv[36] = 8'hbb;
      expv[37] = 8'he1;
      expv[38] = 8'he1;
      expv[39] = 8'he1;
      expv[40] = 8'hc4;
      expv[41] = 8'hc4;
      expv[42] = 8'hc4;
      expv[43] = 8'hdf;
      expv[44] = 8'h9c;
      expv[45] = 8'h6e;
      expv[46] = 8'h6e;
      expv[47] = 8'h11;
      expv[48] = 8'h10;
      expv[49] = 8'h9b;
      expv[50] = 8'hdc;
      expv[51] = 8'h4e;
      expv[52] = 8'h64;
      expv[53] = 8'hea;
      expv[54] = 8'hea;
      expv[55] = 8'hea;
      expv[56] = 8'hd2;
      expv[57] = 8'hd2;
      expv[58] = 8'hbb;
      expv[59] = 8'hc2;
      expv[60] = 8'hde;
      expv[61] = 8'h66;
      expv[62] = 8'hfa;
      expv[63] = 8'hfa;
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
