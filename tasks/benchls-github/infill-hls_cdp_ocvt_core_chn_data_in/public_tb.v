// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HLS_cdp_ocvt_core_chn_data_in_rsci_chn_data_in_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[53:53]),
    .chn_data_in_rsci_oswt(in_vec[52:52]),
    .chn_data_in_rsci_biwt(in_vec[51:51]),
    .chn_data_in_rsci_bdwt(in_vec[50:50]),
    .chn_data_in_rsci_d(in_vec[49:0]),
    .chn_data_in_rsci_bawt(out_vec[51:51]),
    .chn_data_in_rsci_wen_comp(out_vec[50:50]),
    .chn_data_in_rsci_d_mxwt(out_vec[49:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h15a35055c6c2d5;
    stim[1] = 54'h00548b768438ad;
    stim[2] = 54'h3c5374292f6790;
    stim[3] = 54'h06b9971f63684b;
    stim[4] = 54'h32bf7040b761cd;
    stim[5] = 54'h33ff13c3d6d76f;
    stim[6] = 54'h21064825a0ecf9;
    stim[7] = 54'h3c13c708ab8460;
    stim[8] = 54'h27bc80c27a69f8;
    stim[9] = 54'h3169c33e053bfa;
    stim[10] = 54'h2adb2b8ad8dcd9;
    stim[11] = 54'h220e040c45fdf9;
    stim[12] = 54'h3005ca752ced3a;
    stim[13] = 54'h326e9c6eacbbbc;
    stim[14] = 54'h32c12fcff220d6;
    stim[15] = 54'h2a11576c307baf;
    stim[16] = 54'h321dff35c32d4e;
    stim[17] = 54'h12ea641d8608b7;
    stim[18] = 54'h336d5eb0966c17;
    stim[19] = 54'h35d7df611e0e3c;
    stim[20] = 54'h37dbd448c12e9d;
    stim[21] = 54'h3dacce9416eafb;
    stim[22] = 54'h2df534f8eaf745;
    stim[23] = 54'h305210317cb46c;
    stim[24] = 54'h2c7fae451b13a1;
    stim[25] = 54'h350111dde74eca;
    stim[26] = 54'h20282fdd36b41b;
    stim[27] = 54'h20732a97b5e8a5;
    stim[28] = 54'h269f79555858d0;
    stim[29] = 54'h3b13589498f507;
    stim[30] = 54'h3a869ecb0500cd;
    stim[31] = 54'h328f1cc1129b70;
    stim[32] = 54'h2fd14531b842ea;
    stim[33] = 54'h3f991c3185398b;
    stim[34] = 54'h20fd5607ee548b;
    stim[35] = 54'h290ce9a62e6150;
    stim[36] = 54'h29bb0602278dff;
    stim[37] = 54'h24c2ed91f16be2;
    stim[38] = 54'h3ae0442ddc9e9e;
    stim[39] = 54'h2931ba28692b1d;
    stim[40] = 54'h361a7da08b4510;
    stim[41] = 54'h24067cbe5132b9;
    stim[42] = 54'h267a1a12df90b4;
    stim[43] = 54'h3ba2ed4d450f34;
    stim[44] = 54'h37aee93a1907d6;
    stim[45] = 54'h29b5dfd0f8060a;
    stim[46] = 54'h3c303d8840d014;
    stim[47] = 54'h31abab68f7fa96;
    stim[48] = 54'h2aea6f81b27f9f;
    stim[49] = 54'h35b616061acb48;
    stim[50] = 54'h29b27eecb27026;
    stim[51] = 54'h2d00341f52c128;
    stim[52] = 54'h3d9417dcef5eca;
    stim[53] = 54'h2c34ad4012fde7;
    stim[54] = 54'h2877e6df7bae7e;
    stim[55] = 54'h373dfb21a80b0d;
    stim[56] = 54'h3d3ff596f60ef5;
    stim[57] = 54'h33b1479f72b701;
    stim[58] = 54'h20e45eb046ab88;
    stim[59] = 54'h3a747c2d6565ef;
    stim[60] = 54'h2eb6a8ff355353;
    stim[61] = 54'h24df6b96c83931;
    stim[62] = 54'h38061a3ba9b5c4;
    stim[63] = 54'h2eb15041aba366;
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
      expv[0] = 52'h1a35055c6c2d5;
      expv[1] = 52'h4548b768438ad;
      expv[2] = 52'hc5374292f6790;
      expv[3] = 52'h6b9971f63684b;
      expv[4] = 52'h2bf7040b761cd;
      expv[5] = 52'h3ff13c3d6d76f;
      expv[6] = 52'h5064825a0ecf9;
      expv[7] = 52'hc13c708ab8460;
      expv[8] = 52'h7bc80c27a69f8;
      expv[9] = 52'h169c33e053bfa;
      expv[10] = 52'hedb2b8ad8dcd9;
      expv[11] = 52'hedb2b8ad8dcd9;
      expv[12] = 52'hedb2b8ad8dcd9;
      expv[13] = 52'hedb2b8ad8dcd9;
      expv[14] = 52'hedb2b8ad8dcd9;
      expv[15] = 52'hedb2b8ad8dcd9;
      expv[16] = 52'hedb2b8ad8dcd9;
      expv[17] = 52'h2ea641d8608b7;
      expv[18] = 52'h36d5eb0966c17;
      expv[19] = 52'h1d7df611e0e3c;
      expv[20] = 52'h3dbd448c12e9d;
      expv[21] = 52'hdacce9416eafb;
      expv[22] = 52'hdf534f8eaf745;
      expv[23] = 52'h05210317cb46c;
      expv[24] = 52'hc7fae451b13a1;
      expv[25] = 52'h10111dde74eca;
      expv[26] = 52'h4282fdd36b41b;
      expv[27] = 52'h4732a97b5e8a5;
      expv[28] = 52'h69f79555858d0;
      expv[29] = 52'hf13589498f507;
      expv[30] = 52'hf13589498f507;
      expv[31] = 52'hf13589498f507;
      expv[32] = 52'hf13589498f507;
      expv[33] = 52'hf991c3185398b;
      expv[34] = 52'h4fd5607ee548b;
      expv[35] = 52'hd0ce9a62e6150;
      expv[36] = 52'hd0ce9a62e6150;
      expv[37] = 52'hd0ce9a62e6150;
      expv[38] = 52'hee0442ddc9e9e;
      expv[39] = 52'hee0442ddc9e9e;
      expv[40] = 52'hee0442ddc9e9e;
      expv[41] = 52'h4067cbe5132b9;
      expv[42] = 52'h67a1a12df90b4;
      expv[43] = 52'hfa2ed4d450f34;
      expv[44] = 52'hfa2ed4d450f34;
      expv[45] = 52'hdb5dfd0f8060a;
      expv[46] = 52'hdb5dfd0f8060a;
      expv[47] = 52'h1abab68f7fa96;
      expv[48] = 52'heea6f81b27f9f;
      expv[49] = 52'heea6f81b27f9f;
      expv[50] = 52'hdb27eecb27026;
      expv[51] = 52'hdb27eecb27026;
      expv[52] = 52'hd9417dcef5eca;
      expv[53] = 52'hc34ad4012fde7;
      expv[54] = 52'hc77e6df7bae7e;
      expv[55] = 52'hc77e6df7bae7e;
      expv[56] = 52'hd3ff596f60ef5;
      expv[57] = 52'h3b1479f72b701;
      expv[58] = 52'h4e45eb046ab88;
      expv[59] = 52'he747c2d6565ef;
      expv[60] = 52'he747c2d6565ef;
      expv[61] = 52'h4df6b96c83931;
      expv[62] = 52'hc061a3ba9b5c4;
      expv[63] = 52'hc061a3ba9b5c4;
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
