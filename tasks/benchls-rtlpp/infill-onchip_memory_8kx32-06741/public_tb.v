// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06741 dut (
    .clk(clk),
    .address(in_vec[54:42]),
    .byteenable(in_vec[41:38]),
    .chipselect(in_vec[37:37]),
    .clken(in_vec[36:36]),
    .freeze(in_vec[35:35]),
    .reset(in_vec[34:34]),
    .reset_req(in_vec[33:33]),
    .write(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h727a5581c1cd3d;
    stim[1] = 55'h5e3adf7cf9a440;
    stim[2] = 55'h5f868839ba21f8;
    stim[3] = 55'h3ff074834c5c03;
    stim[4] = 55'h189b3b9029c290;
    stim[5] = 55'h1dba01de43e437;
    stim[6] = 55'h0bd4b977427483;
    stim[7] = 55'h31643a7c23b813;
    stim[8] = 55'h20fbb2ceaaa451;
    stim[9] = 55'h03a45a91a5073b;
    stim[10] = 55'h3a23bb67519786;
    stim[11] = 55'h587e50572da41a;
    stim[12] = 55'h572e3a14dbe3b6;
    stim[13] = 55'h53a4b26687dd40;
    stim[14] = 55'h4e963be10576c1;
    stim[15] = 55'h2089e15f1c344f;
    stim[16] = 55'h6db7c3384d7398;
    stim[17] = 55'h608193990f4c21;
    stim[18] = 55'h25b7039b381a5a;
    stim[19] = 55'h2d5fb0a79ad6b8;
    stim[20] = 55'h7275ebef60a7eb;
    stim[21] = 55'h1e0758a59cb26b;
    stim[22] = 55'h78ed43f8e2b757;
    stim[23] = 55'h06fd320e53c060;
    stim[24] = 55'h7709d2a4978a9e;
    stim[25] = 55'h5149c9c5559f63;
    stim[26] = 55'h3148fb3d6c35fc;
    stim[27] = 55'h21e5d91131d505;
    stim[28] = 55'h27fba0aca0d1df;
    stim[29] = 55'h636813dcd02e28;
    stim[30] = 55'h0d6771ec19d9d8;
    stim[31] = 55'h13719a6fdc59a3;
    stim[32] = 55'h1679e3ed84505e;
    stim[33] = 55'h6205404100c448;
    stim[34] = 55'h0c120181325ef4;
    stim[35] = 55'h409c5a84108775;
    stim[36] = 55'h336540a671561f;
    stim[37] = 55'h2e1c897b12107a;
    stim[38] = 55'h526d307528b445;
    stim[39] = 55'h209a4b7f7a497f;
    stim[40] = 55'h6a127bb4d4e3b4;
    stim[41] = 55'h4cad53139e400e;
    stim[42] = 55'h5440824abed7e8;
    stim[43] = 55'h28d1a197c52dc2;
    stim[44] = 55'h7510f2e3c39e9d;
    stim[45] = 55'h76ef9001007ca0;
    stim[46] = 55'h4c0ee3b2ce5b8f;
    stim[47] = 55'h13a3c1b3158c13;
    stim[48] = 55'h5e4072de71a932;
    stim[49] = 55'h3323731493b4ea;
    stim[50] = 55'h2410386f2150ad;
    stim[51] = 55'h2576b1e7c5d424;
    stim[52] = 55'h05a6e13d92600a;
    stim[53] = 55'h1f8b689f630acf;
    stim[54] = 55'h1ab0b3afd07f81;
    stim[55] = 55'h4e735249bbbfa4;
    stim[56] = 55'h6dac485a0d698f;
    stim[57] = 55'h6ff05abc2038ec;
    stim[58] = 55'h73f1a367438234;
    stim[59] = 55'h249e6a99db4dc8;
    stim[60] = 55'h7cad9b0a0b6ae6;
    stim[61] = 55'h5890317991fedf;
    stim[62] = 55'h3be2619067150e;
    stim[63] = 55'h36c450918ad4b0;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
