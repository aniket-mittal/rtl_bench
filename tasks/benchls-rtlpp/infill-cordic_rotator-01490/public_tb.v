// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01490 dut (
    .i_clk(clk),
    .i_reset(in_vec[59:59]),
    .i_ce(in_vec[58:58]),
    .i_xval(in_vec[57:42]),
    .i_yval(in_vec[41:26]),
    .i_phase(in_vec[25:1]),
    .i_aux(in_vec[0:0]),
    .o_xval(out_vec[32:17]),
    .o_yval(out_vec[16:1]),
    .o_aux(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'h9b70e629c98bd45;
    stim[1] = 60'heee6e0611604e75;
    stim[2] = 60'h4845f61f239a021;
    stim[3] = 60'h3201e78c3308cfb;
    stim[4] = 60'h18bbe6f392fc85a;
    stim[5] = 60'h0418e3fea25fde5;
    stim[6] = 60'h63cf995b93ea1b0;
    stim[7] = 60'h37c5f51fde61eec;
    stim[8] = 60'h4dab1cb446a6920;
    stim[9] = 60'h7b873d25e828e5c;
    stim[10] = 60'h18be1346025bb6b;
    stim[11] = 60'h5c6757589140ede;
    stim[12] = 60'h423ba5f9dfe4fa4;
    stim[13] = 60'hf4fd0138e0d7f06;
    stim[14] = 60'h5e57411cc823c36;
    stim[15] = 60'h4b68c65c2ef68fe;
    stim[16] = 60'h45efeef4b1c3918;
    stim[17] = 60'h338012703432c34;
    stim[18] = 60'h528c9bb22c2edff;
    stim[19] = 60'h76384eaa0afbcf1;
    stim[20] = 60'h1d3593659f772c9;
    stim[21] = 60'h4be6a7fab406bd7;
    stim[22] = 60'h337415db23a066c;
    stim[23] = 60'h4714797db26c88c;
    stim[24] = 60'h161c7594334d138;
    stim[25] = 60'h392285a2988321b;
    stim[26] = 60'h3db98c66b1e3252;
    stim[27] = 60'h2e22aa250e23ce4;
    stim[28] = 60'h1048d867dbd0aac;
    stim[29] = 60'h151d6bf6f88d320;
    stim[30] = 60'h40da2e698da0d91;
    stim[31] = 60'h6237c5d72e98f56;
    stim[32] = 60'h30cf32a3f0f5f60;
    stim[33] = 60'h4d101063db14297;
    stim[34] = 60'h0a72e51baac94ea;
    stim[35] = 60'h5dd1272ff90e706;
    stim[36] = 60'h23b55e91f706fee;
    stim[37] = 60'h1217a4527a180db;
    stim[38] = 60'h20f11b6ead27211;
    stim[39] = 60'h4f40b9ee0fd715c;
    stim[40] = 60'h5a2c0dbabb173bd;
    stim[41] = 60'h0a459e37c53beb6;
    stim[42] = 60'h6dda0970543040c;
    stim[43] = 60'h68a92266aed590a;
    stim[44] = 60'h6c19a889d3ba1e8;
    stim[45] = 60'h05a5cb6bb62adad;
    stim[46] = 60'h57e026c5e829fb1;
    stim[47] = 60'h52ae0f4d0196240;
    stim[48] = 60'h56387f0cf364b1a;
    stim[49] = 60'h19d5d847eccf242;
    stim[50] = 60'h7dc33cee1a8509f;
    stim[51] = 60'h308c1256b292a1b;
    stim[52] = 60'h348ecbbac81d7f4;
    stim[53] = 60'h0ec817456f07625;
    stim[54] = 60'h44e3788d1448ce4;
    stim[55] = 60'h2fc21cbbada8cd7;
    stim[56] = 60'h1944900d593e61d;
    stim[57] = 60'h07efcf253e81c8b;
    stim[58] = 60'h4ab04fc79d778a6;
    stim[59] = 60'h0e21def015aa8d4;
    stim[60] = 60'h555afd8b2befc04;
    stim[61] = 60'h100d1b3e04eba24;
    stim[62] = 60'h3ac2af2911798fa;
    stim[63] = 60'h5d281672daf7545;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h0afad66fa;
      expv[61] = 33'h0afad66fa;
      expv[62] = 33'h090fa176e;
      expv[63] = 33'h090fa176e;
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
