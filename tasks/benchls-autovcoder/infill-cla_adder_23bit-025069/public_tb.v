// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025069 dut (
    .in1(in_vec[45:23]),
    .in2(in_vec[22:0]),
    .sum(out_vec[23:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h133481eed6ff;
    stim[1] = 46'h2a096c18d275;
    stim[2] = 46'h1beb280b04e8;
    stim[3] = 46'h3012b231dba7;
    stim[4] = 46'h39d874bab220;
    stim[5] = 46'h2a8b94a81b13;
    stim[6] = 46'h27c7fc1b1829;
    stim[7] = 46'h12cfa8cf974d;
    stim[8] = 46'h24eb933d226e;
    stim[9] = 46'h38d375de5267;
    stim[10] = 46'h146b9773bd78;
    stim[11] = 46'h16034ab69360;
    stim[12] = 46'h0553200facdd;
    stim[13] = 46'h16a193bf0c98;
    stim[14] = 46'h084536febb55;
    stim[15] = 46'h00852f15af42;
    stim[16] = 46'h34c5f322905a;
    stim[17] = 46'h30554c76f031;
    stim[18] = 46'h19116836ab9a;
    stim[19] = 46'h317f74808ae8;
    stim[20] = 46'h299a8704439e;
    stim[21] = 46'h0b9fcfcce9ab;
    stim[22] = 46'h0154ba23a7b5;
    stim[23] = 46'h36c92972d09a;
    stim[24] = 46'h236075c5d55b;
    stim[25] = 46'h124b64bd74f5;
    stim[26] = 46'h2fec8936a71a;
    stim[27] = 46'h2c4e9f6e46f9;
    stim[28] = 46'h1985ca0e8633;
    stim[29] = 46'h18fa9dac954b;
    stim[30] = 46'h38cb9af1ff6e;
    stim[31] = 46'h077c8f00ebdd;
    stim[32] = 46'h24e5d1edf748;
    stim[33] = 46'h2a098ff8a4d0;
    stim[34] = 46'h1fcfb687cd04;
    stim[35] = 46'h1906bd95fd8e;
    stim[36] = 46'h0614c79662df;
    stim[37] = 46'h345c926aa6a4;
    stim[38] = 46'h318419991096;
    stim[39] = 46'h371ccb1ba58c;
    stim[40] = 46'h39c325029d2e;
    stim[41] = 46'h27418f7dc420;
    stim[42] = 46'h1f1328459526;
    stim[43] = 46'h12ba71ca9b8d;
    stim[44] = 46'h396ad2238b1e;
    stim[45] = 46'h3ad511f90be1;
    stim[46] = 46'h1927663c0572;
    stim[47] = 46'h0ca2d05c34cd;
    stim[48] = 46'h346d623a2a3a;
    stim[49] = 46'h1d7fdcf1500f;
    stim[50] = 46'h3c8521ce32aa;
    stim[51] = 46'h1b0bb7c8e235;
    stim[52] = 46'h3459721a3d93;
    stim[53] = 46'h2ddc537dc3b3;
    stim[54] = 46'h066ab93f090c;
    stim[55] = 46'h31ea86cfa410;
    stim[56] = 46'h27dd91ffe40c;
    stim[57] = 46'h2967f966abbd;
    stim[58] = 46'h0a9353da877d;
    stim[59] = 46'h169b2c0a9833;
    stim[60] = 46'h38d60063164c;
    stim[61] = 46'h02ae27a49f1b;
    stim[62] = 46'h39cfced6855f;
    stim[63] = 46'h0992814f542c;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 24'hc001db;
      expv[1] = 24'hc99342;
      expv[2] = 24'h218cbc;
      expv[3] = 24'h0c7f93;
      expv[4] = 24'h9b5b2a;
      expv[5] = 24'h5dc0bf;
      expv[6] = 24'hb40aca;
      expv[7] = 24'h3de397;
      expv[8] = 24'hdb304e;
      expv[9] = 24'hbdb009;
      expv[10] = 24'h93a8e2;
      expv[11] = 24'hb029a0;
      expv[12] = 24'hbd9b40;
      expv[13] = 24'hfdf3b0;
      expv[14] = 24'h612e87;
      expv[15] = 24'hbd4628;
      expv[16] = 24'hc1dada;
      expv[17] = 24'ha56474;
      expv[18] = 24'h6519b8;
      expv[19] = 24'haed046;
      expv[20] = 24'hea6eea;
      expv[21] = 24'hcf941b;
      expv[22] = 24'hdc7b04;
      expv[23] = 24'ha35504;
      expv[24] = 24'hb1af05;
      expv[25] = 24'h4297e1;
      expv[26] = 24'ha18166;
      expv[27] = 24'h1c1b91;
      expv[28] = 24'hf6323c;
      expv[29] = 24'haf58c1;
      expv[30] = 24'h23e91d;
      expv[31] = 24'h347671;
      expv[32] = 24'hd8c348;
      expv[33] = 24'h03ed49;
      expv[34] = 24'hd7addc;
      expv[35] = 24'h506ff5;
      expv[36] = 24'hecda99;
      expv[37] = 24'h4a026c;
      expv[38] = 24'h35195f;
      expv[39] = 24'h9b424e;
      expv[40] = 24'hc71b0e;
      expv[41] = 24'h7ce530;
      expv[42] = 24'h6f0e1e;
      expv[43] = 24'h7907f7;
      expv[44] = 24'h9e7d12;
      expv[45] = 24'h4c264d;
      expv[46] = 24'h821288;
      expv[47] = 24'hb8ced2;
      expv[48] = 24'h7faf72;
      expv[49] = 24'h8e09eb;
      expv[50] = 24'h179d11;
      expv[51] = 24'ha32f7f;
      expv[52] = 24'hf1096e;
      expv[53] = 24'h32e199;
      expv[54] = 24'h7f3c2c;
      expv[55] = 24'hb8d1b8;
      expv[56] = 24'hf505f0;
      expv[57] = 24'h0dc8b1;
      expv[58] = 24'ha44603;
      expv[59] = 24'he68604;
      expv[60] = 24'h329e54;
      expv[61] = 24'hcb33c5;
      expv[62] = 24'hb49b39;
      expv[63] = 24'h74cfba;
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
