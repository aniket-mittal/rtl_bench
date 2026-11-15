// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_089812 dut (
    .toplevel_main_clk(clk),
    .io_push_valid(in_vec[36:36]),
    .io_push_payload_error(in_vec[35:35]),
    .io_push_payload_inst(in_vec[34:3]),
    .io_pop_ready(in_vec[2:2]),
    .io_flush(in_vec[1:1]),
    .toplevel_main_reset_(in_vec[0:0]),
    .io_push_ready(out_vec[35:35]),
    .io_pop_valid(out_vec[34:34]),
    .io_pop_payload_error(out_vec[33:33]),
    .io_pop_payload_inst(out_vec[32:1]),
    .io_occupancy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h02882a182f;
    stim[1] = 37'h059a58397f;
    stim[2] = 37'h15fb0c211a;
    stim[3] = 37'h1d19730fc8;
    stim[4] = 37'h0ae6c94744;
    stim[5] = 37'h16d7f33f96;
    stim[6] = 37'h185552ce7e;
    stim[7] = 37'h0e3c8175ba;
    stim[8] = 37'h00ea1e5196;
    stim[9] = 37'h04d17e9270;
    stim[10] = 37'h1aeae47cb8;
    stim[11] = 37'h090feff248;
    stim[12] = 37'h17c951ab94;
    stim[13] = 37'h0011d985de;
    stim[14] = 37'h04806444d8;
    stim[15] = 37'h0e7b50df4e;
    stim[16] = 37'h02a131c3ce;
    stim[17] = 37'h1d7cd85308;
    stim[18] = 37'h0861e73954;
    stim[19] = 37'h1fdd82c094;
    stim[20] = 37'h0d6f33303a;
    stim[21] = 37'h00b4b3f344;
    stim[22] = 37'h1898787ad8;
    stim[23] = 37'h19d5ee2930;
    stim[24] = 37'h0c156c1b02;
    stim[25] = 37'h012490241e;
    stim[26] = 37'h069d8a123c;
    stim[27] = 37'h15a45501ea;
    stim[28] = 37'h0b09858270;
    stim[29] = 37'h03f372aff6;
    stim[30] = 37'h17b1e15eae;
    stim[31] = 37'h1dcbdc2d8c;
    stim[32] = 37'h16263e28da;
    stim[33] = 37'h166d939836;
    stim[34] = 37'h02e1e7e860;
    stim[35] = 37'h19bf0a2816;
    stim[36] = 37'h094cc834c6;
    stim[37] = 37'h068815d2a6;
    stim[38] = 37'h1455cac218;
    stim[39] = 37'h1426684e28;
    stim[40] = 37'h0850f3e66e;
    stim[41] = 37'h0e6c1f0602;
    stim[42] = 37'h19d5286904;
    stim[43] = 37'h0475389cb8;
    stim[44] = 37'h07a135b0b3;
    stim[45] = 37'h01238ed290;
    stim[46] = 37'h0010b8b8a0;
    stim[47] = 37'h044c28a650;
    stim[48] = 37'h18132b6452;
    stim[49] = 37'h1407d88b70;
    stim[50] = 37'h165049b6b1;
    stim[51] = 37'h17e214664a;
    stim[52] = 37'h0656af0c14;
    stim[53] = 37'h18544606e2;
    stim[54] = 37'h0ce26d6454;
    stim[55] = 37'h1e9fadf5e0;
    stim[56] = 37'h15bb4cfe44;
    stim[57] = 37'h1eba508e7a;
    stim[58] = 37'h02eab7a5aa;
    stim[59] = 37'h0604a45938;
    stim[60] = 37'h18c6a40f50;
    stim[61] = 37'h1ce18f7fe6;
    stim[62] = 37'h139349b462;
    stim[63] = 37'h0ea5567f48;
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
      expv[0] = 36'hxa20a860x;
      expv[1] = 36'h966960e5e;
      expv[2] = 36'hd7ec30846;
      expv[3] = 36'hf465cc3f2;
      expv[4] = 36'hab9b251d0;
      expv[5] = 36'hdb5fccfe4;
      expv[6] = 36'he1554b39e;
      expv[7] = 36'hb8f205d6e;
      expv[8] = 36'h83a879464;
      expv[9] = 36'h9345fa49c;
      expv[10] = 36'hebab91f2e;
      expv[11] = 36'ha43fbfc92;
      expv[12] = 36'hdf2546ae4;
      expv[13] = 36'h804766176;
      expv[14] = 36'h920191136;
      expv[15] = 36'hb9ed437d2;
      expv[16] = 36'h8a84c70f2;
      expv[17] = 36'hf5f3614c2;
      expv[18] = 36'ha1879ce54;
      expv[19] = 36'hff760b024;
      expv[20] = 36'hb5bcccc0e;
      expv[21] = 36'h82d2cfcd0;
      expv[22] = 36'he261e1eb6;
      expv[23] = 36'he757b8a4c;
      expv[24] = 36'hb055b06c0;
      expv[25] = 36'h849240906;
      expv[26] = 36'h9a762848e;
      expv[27] = 36'hd6915407a;
      expv[28] = 36'hac261609c;
      expv[29] = 36'h8fcdcabfc;
      expv[30] = 36'hdec7857aa;
      expv[31] = 36'hf72f70b62;
      expv[32] = 36'hd898f8a36;
      expv[33] = 36'hd9b64e60c;
      expv[34] = 36'h8b879fa18;
      expv[35] = 36'he6fc28a04;
      expv[36] = 36'ha53320d30;
      expv[37] = 36'h9a20574a8;
      expv[38] = 36'hd1572b086;
      expv[39] = 36'hd099a138a;
      expv[40] = 36'ha143cf99a;
      expv[41] = 36'hb9b07c180;
      expv[42] = 36'he754a1a40;
      expv[43] = 36'h91d4e272e;
      expv[44] = 36'h9e84d6c2c;
      expv[45] = 36'h848e3b4a4;
      expv[46] = 36'h8042e2e28;
      expv[47] = 36'h9130a2994;
      expv[48] = 36'he04cad914;
      expv[49] = 36'hd01f622dc;
      expv[50] = 36'hd94126dac;
      expv[51] = 36'h594126dad;
      expv[52] = 36'h995abc304;
      expv[53] = 36'he151181b8;
      expv[54] = 36'hb389b5914;
      expv[55] = 36'hfa7eb7d78;
      expv[56] = 36'hd6ed33f90;
      expv[57] = 36'hfae94239e;
      expv[58] = 36'h8baade96a;
      expv[59] = 36'h98129164e;
      expv[60] = 36'he31a903d4;
      expv[61] = 36'hf3863dff8;
      expv[62] = 36'hce4d26d18;
      expv[63] = 36'hba9559fd2;
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
