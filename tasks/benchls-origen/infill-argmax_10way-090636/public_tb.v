// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_090636 dut (
    .mac0(in_vec[79:72]),
    .mac1(in_vec[71:64]),
    .mac2(in_vec[63:56]),
    .mac3(in_vec[55:48]),
    .mac4(in_vec[47:40]),
    .mac5(in_vec[39:32]),
    .mac6(in_vec[31:24]),
    .mac7(in_vec[23:16]),
    .mac8(in_vec[15:8]),
    .mac9(in_vec[7:0]),
    .calculated_class(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'he2b69444e8eccbf33cb4;
    stim[1] = 80'hc4648dad0ecbbd0ef272;
    stim[2] = 80'he1471e0e3c07b3f770f9;
    stim[3] = 80'hdcaf66baf2d7597aed9f;
    stim[4] = 80'h415aef9cffda53a84661;
    stim[5] = 80'hb5acde3d079fa3d05e31;
    stim[6] = 80'hd0c972f9fa59674b1a11;
    stim[7] = 80'h21612158ab2aaaf61db2;
    stim[8] = 80'h980e785cb9e1575adf7f;
    stim[9] = 80'h445186c6d3d83a0fb336;
    stim[10] = 80'h4a9b19d5832e9f4a9504;
    stim[11] = 80'hfb090d590d3e0b190648;
    stim[12] = 80'hf5154912654bc1bde3db;
    stim[13] = 80'hd24289d166d374dd169d;
    stim[14] = 80'he42f7306d1bd8e3313dd;
    stim[15] = 80'h340810f3d95cb07609e8;
    stim[16] = 80'h25b4eb69bfe3b0150357;
    stim[17] = 80'h737f5f52c54b007be508;
    stim[18] = 80'h52ec0344eb591c79a722;
    stim[19] = 80'h3e4b6fe19b4d613d180c;
    stim[20] = 80'h58e666602bb847b8677d;
    stim[21] = 80'h100746dddf3dc087ea74;
    stim[22] = 80'hd060dde07e6a480ebfb2;
    stim[23] = 80'hedf395f619d6a049b3c5;
    stim[24] = 80'h2444483b651584915cd5;
    stim[25] = 80'h4db79ba4ed1851914a58;
    stim[26] = 80'hdc067e4aa0a93cbec4ed;
    stim[27] = 80'hc55564f07b0e892e6e73;
    stim[28] = 80'hf5bee698f58f307c7ee6;
    stim[29] = 80'hf4b0baf6b2d4fe98efc8;
    stim[30] = 80'hef93e98d6c50dbd43b58;
    stim[31] = 80'h722bc7f8f2cda5c80a29;
    stim[32] = 80'h15e0207d70a7472ff9fb;
    stim[33] = 80'hdf408b2831dc373c85be;
    stim[34] = 80'h68d3105854da2be4bfe2;
    stim[35] = 80'ha37cf584e96964169239;
    stim[36] = 80'h1c677807d58562387afa;
    stim[37] = 80'h96ef99122ae829ca564c;
    stim[38] = 80'had90b6193b423387879e;
    stim[39] = 80'hce5cb698f4735c427da9;
    stim[40] = 80'hbf4cfd1e45624b11f3cf;
    stim[41] = 80'h1f4904007d18fbf48788;
    stim[42] = 80'h84d1ee9cd6defbede9b6;
    stim[43] = 80'h273bd8ee58c3b9af239d;
    stim[44] = 80'h6e104e4f4862cd1a4b54;
    stim[45] = 80'h4add72b05a12ab895fce;
    stim[46] = 80'he8c553a41b67ab3ccc7a;
    stim[47] = 80'h31491f2da18d9ee13cd0;
    stim[48] = 80'h0696b647288c5d2809b1;
    stim[49] = 80'hfdb70e4091e928bf36ef;
    stim[50] = 80'hb52735bab1fe486bf2af;
    stim[51] = 80'hb2d75cbf952ecfb394b9;
    stim[52] = 80'h12e97fc49dc97ba27409;
    stim[53] = 80'hbebfb0fdffb05571cafa;
    stim[54] = 80'hb0a49a05d361efe58436;
    stim[55] = 80'hb3cba03aaf652779fdb8;
    stim[56] = 80'h5f08f162b43766991098;
    stim[57] = 80'h974bc4809e48c39138d9;
    stim[58] = 80'h6945297b6db5c019c36c;
    stim[59] = 80'h57256270b0d5695e4423;
    stim[60] = 80'h592c4c59ed3635f6a24d;
    stim[61] = 80'h18e1a10eb8e498ab2f56;
    stim[62] = 80'h6c246b8a4723754092c9;
    stim[63] = 80'h7592e03556a4cdc2b291;
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
      expv[0] = 8'h07;
      expv[1] = 8'h08;
      expv[2] = 8'h09;
      expv[3] = 8'h04;
      expv[4] = 8'h04;
      expv[5] = 8'h02;
      expv[6] = 8'h04;
      expv[7] = 8'h07;
      expv[8] = 8'h05;
      expv[9] = 8'h05;
      expv[10] = 8'h03;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h07;
      expv[14] = 8'h00;
      expv[15] = 8'h03;
      expv[16] = 8'h02;
      expv[17] = 8'h08;
      expv[18] = 8'h01;
      expv[19] = 8'h03;
      expv[20] = 8'h01;
      expv[21] = 8'h08;
      expv[22] = 8'h03;
      expv[23] = 8'h03;
      expv[24] = 8'h09;
      expv[25] = 8'h04;
      expv[26] = 8'h09;
      expv[27] = 8'h03;
      expv[28] = 8'h00;
      expv[29] = 8'h06;
      expv[30] = 8'h00;
      expv[31] = 8'h03;
      expv[32] = 8'h09;
      expv[33] = 8'h00;
      expv[34] = 8'h07;
      expv[35] = 8'h02;
      expv[36] = 8'h09;
      expv[37] = 8'h01;
      expv[38] = 8'h02;
      expv[39] = 8'h04;
      expv[40] = 8'h02;
      expv[41] = 8'h06;
      expv[42] = 8'h06;
      expv[43] = 8'h03;
      expv[44] = 8'h06;
      expv[45] = 8'h01;
      expv[46] = 8'h00;
      expv[47] = 8'h07;
      expv[48] = 8'h02;
      expv[49] = 8'h00;
      expv[50] = 8'h05;
      expv[51] = 8'h01;
      expv[52] = 8'h01;
      expv[53] = 8'h04;
      expv[54] = 8'h06;
      expv[55] = 8'h08;
      expv[56] = 8'h02;
      expv[57] = 8'h09;
      expv[58] = 8'h08;
      expv[59] = 8'h05;
      expv[60] = 8'h07;
      expv[61] = 8'h05;
      expv[62] = 8'h09;
      expv[63] = 8'h02;
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
