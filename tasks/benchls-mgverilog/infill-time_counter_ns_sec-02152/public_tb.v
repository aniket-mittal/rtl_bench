// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 102;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02152 dut (
    .clk_in(clk),
    .sec_data_in(in_vec[101:38]),
    .nanosec_data_in(in_vec[37:6]),
    .pps_in(in_vec[5:5]),
    .cnt_ena_in(in_vec[4:4]),
    .pps_bypass_in(in_vec[3:3]),
    .clr_n_in(in_vec[2:2]),
    .load_sec_in(in_vec[1:1]),
    .load_nanosec_in(in_vec[0:0]),
    .sec_data_out(out_vec[95:32]),
    .nanosec_data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 102'h1b2c8f95b9b7fa82faf1b86ce8;
    stim[1] = 102'h15f5ad897e2f0455b034ad84e8;
    stim[2] = 102'h1cbd83e534113945f1a9cdd1ec;
    stim[3] = 102'h1e55f2b1d88b2415b8bfd30186;
    stim[4] = 102'h27dd744236775c0e1bbc5300e7;
    stim[5] = 102'h09df23e466cd8a2287ca0e6db4;
    stim[6] = 102'h316fb1ec6a8637d364cc0aacb4;
    stim[7] = 102'h0fac9e587b5b995a0813ca8c26;
    stim[8] = 102'h139230c5fd478eaf31cb4edfbc;
    stim[9] = 102'h099752da4223b28991b0611b65;
    stim[10] = 102'h3a27537d160c9dfb2d6d8775dd;
    stim[11] = 102'h2f5a50e32e31726046c2392fad;
    stim[12] = 102'h3abcdf8eab65ee93de2b154954;
    stim[13] = 102'h2380e7f9aca3c6f6decfe1b5e7;
    stim[14] = 102'h0a418441cf94f0a1b8f2fb8a37;
    stim[15] = 102'h27976cf9042b2e665585689466;
    stim[16] = 102'h1b7309ac49495a9928de92b775;
    stim[17] = 102'h0e13b32318af05ce6249d45f9d;
    stim[18] = 102'h104a3c95cd1d7fcfcd63b9bfee;
    stim[19] = 102'h31635be2673166b0d65b0fe96c;
    stim[20] = 102'h18900bea2108b9aecc8d1b302f;
    stim[21] = 102'h1de1258f78ff19e550b3ce254d;
    stim[22] = 102'h106d2080cf381d95d6758d3f76;
    stim[23] = 102'h27d68d261c770cba111e5d9827;
    stim[24] = 102'h21022531a1db88cdb501d16384;
    stim[25] = 102'h000c18518a8a0e4e12c938d3b7;
    stim[26] = 102'h263417597611374383bb6f1d07;
    stim[27] = 102'h2d52fbdb8990a7fb4f50ab40f4;
    stim[28] = 102'h32cbe37c93e358e6664ff902ce;
    stim[29] = 102'h1e4b6da21293b486f54f725884;
    stim[30] = 102'h0bc262956063696379e49abd4c;
    stim[31] = 102'h35c684f30cf05e9681ab2e9f7c;
    stim[32] = 102'h05b0634369c38ffb1f62c5c78f;
    stim[33] = 102'h3cd639d1f42fe384ecef666f1d;
    stim[34] = 102'h119f47b44622ad86ebce27173e;
    stim[35] = 102'h1f56a04bdc0e20935825e0aa37;
    stim[36] = 102'h19fb0d23e9730d416f2669be5f;
    stim[37] = 102'h1052b1d43af8d4b6c604dd09d4;
    stim[38] = 102'h21ed46f4a2996aa7757aaf0404;
    stim[39] = 102'h0df3fd2062eca3a44bd8a10835;
    stim[40] = 102'h28aac8f9dd26c8f6c09e96a8c7;
    stim[41] = 102'h09c0d23b213d6ec872a6ec6d27;
    stim[42] = 102'h3b33585daad31b297629326f77;
    stim[43] = 102'h011fef19101782a8c23d3f0a04;
    stim[44] = 102'h2c3735998570588099cd8bc2e7;
    stim[45] = 102'h0966f67cf6ab4a48334909bcb4;
    stim[46] = 102'h124243ac426c9902d299e5c21f;
    stim[47] = 102'h1d55954a31b15abfa23e485826;
    stim[48] = 102'h2f7edb45d51f3d89692f8dbadd;
    stim[49] = 102'h0938300682fa5277790009822f;
    stim[50] = 102'h2035ac68aa92b30d7770f4144e;
    stim[51] = 102'h1e29f8509e9d43559c46abe59d;
    stim[52] = 102'h28052991464cc1d39b395085af;
    stim[53] = 102'h03820abd92e6f2aa071f1c1ba4;
    stim[54] = 102'h0b021d2875311744c0567db5e4;
    stim[55] = 102'h3ebeda52ff500104e4912eef5c;
    stim[56] = 102'h2aad2d4d5ec6656ccaafcfd0cf;
    stim[57] = 102'h030de957dc2091e29ecb0d9bfc;
    stim[58] = 102'h12ee243404ac279e26c2b09314;
    stim[59] = 102'h02be732d2526a7861080b54187;
    stim[60] = 102'h134488efeec201dba6870c6add;
    stim[61] = 102'h2a35b130363db3593a95f6d4d6;
    stim[62] = 102'h3e738f7b753d78ddea91e42d24;
    stim[63] = 102'h3beaba188deb84defad2f12115;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'h000000000000000000000000;
      expv[4] = 96'h000000000000000000000000;
      expv[5] = 96'h000000000000000000000000;
      expv[6] = 96'h00000000000000001f2839b6;
      expv[7] = 96'h000000000000000000000000;
      expv[8] = 96'h000000000000000000000000;
      expv[9] = 96'h000000000000000000000001;
      expv[10] = 96'h000000000000000000000001;
      expv[11] = 96'h0000000000000000b5b61dd7;
      expv[12] = 96'h000000000000000000000000;
      expv[13] = 96'h000000000000000000000000;
      expv[14] = 96'h000000000000000000000000;
      expv[15] = 96'h0000000000000000e3cbee28;
      expv[16] = 96'h000000000000000000000000;
      expv[17] = 96'h000000000000000000000000;
      expv[18] = 96'h00000000000000008927517e;
      expv[19] = 96'h000000000000000000000000;
      expv[20] = 96'h000000000000000000000000;
      expv[21] = 96'h000000000000000000000000;
      expv[22] = 96'h000000000000000100000000;
      expv[23] = 96'h000000000000000100000001;
      expv[24] = 96'h000000000000000100000001;
      expv[25] = 96'h000000000000000200000001;
      expv[26] = 96'h000000000000000200000002;
      expv[27] = 96'h000000000000000300000002;
      expv[28] = 96'h000000000000000300000003;
      expv[29] = 96'h000000000000000300000003;
      expv[30] = 96'h000000000000000300000003;
      expv[31] = 96'h000000000000000400000003;
      expv[32] = 96'h000000000000000400000004;
      expv[33] = 96'h000000000000000400000004;
      expv[34] = 96'h0000000000000005b3bd99bc;
      expv[35] = 96'h000000000000000500000000;
      expv[36] = 96'h000000000000000500000000;
      expv[37] = 96'h0000000000000005bc99a6f9;
      expv[38] = 96'h000000000000000500000000;
      expv[39] = 96'h000000000000000600000000;
      expv[40] = 96'h000000000000000600000001;
      expv[41] = 96'h000000000000000600000001;
      expv[42] = 96'h000000000000000600000001;
      expv[43] = 96'h000000000000000600000002;
      expv[44] = 96'h000000000000000600000002;
      expv[45] = 96'h000000000000000600000002;
      expv[46] = 96'h0000000000000006cd2426f2;
      expv[47] = 96'h000000000000000600000000;
      expv[48] = 96'h000000000000000600000000;
      expv[49] = 96'h000000000000000600000001;
      expv[50] = 96'h000000000000000600000001;
      expv[51] = 96'h000000000000000600000001;
      expv[52] = 96'h000000000000000600000002;
      expv[53] = 96'h000000000000000600000002;
      expv[54] = 96'h000000000000000600000002;
      expv[55] = 96'h000000000000000600000002;
      expv[56] = 96'h000000000000000600000003;
      expv[57] = 96'h0c37a55f7082478a00000003;
      expv[58] = 96'h0c37a55f7082478a7b2c366f;
      expv[59] = 96'h0c37a55f7082478a00000000;
      expv[60] = 96'h0c37a55f7082478a00000000;
      expv[61] = 96'h0c37a55f7082478a9a1c31ab;
      expv[62] = 96'h0c37a55f7082478a00000000;
      expv[63] = 96'h0c37a55f7082478a00000000;
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
