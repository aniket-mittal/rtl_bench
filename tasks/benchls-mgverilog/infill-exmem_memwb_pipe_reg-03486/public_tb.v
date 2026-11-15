// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03486 dut (
    .clk(clk),
    .s7_exmem(in_vec[56:56]),
    .rf_wen_exmem(in_vec[55:55]),
    .mem2reg_exmem(in_vec[54:54]),
    .rf_waddr_exmem(in_vec[53:50]),
    .aluout_exmem(in_vec[49:34]),
    .extended_exmem(in_vec[33:18]),
    .nop_lw_exmem(in_vec[17:17]),
    .pc_added_exmem(in_vec[16:1]),
    .jal_exmem(in_vec[0:0]),
    .rf_wen_memwb(out_vec[56:56]),
    .mem2reg_memwb(out_vec[55:55]),
    .rf_waddr_memwb(out_vec[54:51]),
    .aluout_memwb(out_vec[50:35]),
    .extended_memwb(out_vec[34:19]),
    .s7_memwb(out_vec[18:18]),
    .nop_lw_memwb(out_vec[17:17]),
    .pc_added_memwb(out_vec[16:1]),
    .jal_memwb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h094f9167548b011;
    stim[1] = 57'h155f7b40b264df7;
    stim[2] = 57'h0af3088b0447324;
    stim[3] = 57'h0f4fdfdfc9d1d8b;
    stim[4] = 57'h1a9a971e7585b82;
    stim[5] = 57'h0d87b733adc2129;
    stim[6] = 57'h075cc6e50e529b9;
    stim[7] = 57'h0bbb968ac943985;
    stim[8] = 57'h0a37c53f9ad7572;
    stim[9] = 57'h05f8df2ef70e94c;
    stim[10] = 57'h16bd3b733cb1bd7;
    stim[11] = 57'h1c7e87de4f988bf;
    stim[12] = 57'h136afcf991aaf3a;
    stim[13] = 57'h0143737c1992a8b;
    stim[14] = 57'h17d39b7f8cd5684;
    stim[15] = 57'h01a22aa8fe831f7;
    stim[16] = 57'h19054d098a7d12c;
    stim[17] = 57'h03306552779eea3;
    stim[18] = 57'h08fb094794d916b;
    stim[19] = 57'h1c4bab68c115133;
    stim[20] = 57'h1a49b8c5247b623;
    stim[21] = 57'h192a38ce758664c;
    stim[22] = 57'h1706d0a0aba0aa6;
    stim[23] = 57'h12cc2e4d3840744;
    stim[24] = 57'h0aa5d9b362e8309;
    stim[25] = 57'h0e2bc10c45140b3;
    stim[26] = 57'h089133e3bb9de71;
    stim[27] = 57'h00f46b5102d2a2a;
    stim[28] = 57'h1bde86edf95e97e;
    stim[29] = 57'h0147fe602ee47a8;
    stim[30] = 57'h18d9ea01520abf3;
    stim[31] = 57'h00eab146b64cb8e;
    stim[32] = 57'h03575c18b47aa10;
    stim[33] = 57'h01e12334656487a;
    stim[34] = 57'h169e7877700e5f8;
    stim[35] = 57'h18315eb6c663624;
    stim[36] = 57'h046e18817e2dde0;
    stim[37] = 57'h0c48571f727af06;
    stim[38] = 57'h0ba7f9fc7a82c80;
    stim[39] = 57'h0de3be27870d2ba;
    stim[40] = 57'h0c91ba94d538c29;
    stim[41] = 57'h0a35c9a1d6cdc8a;
    stim[42] = 57'h180cbb8c6b44981;
    stim[43] = 57'h1bcc2e2258513da;
    stim[44] = 57'h0d69783bb16f511;
    stim[45] = 57'h19c57a646ac6f00;
    stim[46] = 57'h126e7379506ef41;
    stim[47] = 57'h055e3108799b170;
    stim[48] = 57'h0fd723cbdcc4cf9;
    stim[49] = 57'h0165541323fefba;
    stim[50] = 57'h064c6676013bfc5;
    stim[51] = 57'h151875ec53659a9;
    stim[52] = 57'h1f70e69786155b6;
    stim[53] = 57'h0e6aa8a61f4c0f3;
    stim[54] = 57'h0ffd4073ad9b8c0;
    stim[55] = 57'h1d8fbea196c2bff;
    stim[56] = 57'h09bd5f8026815de;
    stim[57] = 57'h0cc17c3c000e956;
    stim[58] = 57'h16c6ebc5fa6a868;
    stim[59] = 57'h1a50070f75e8e6f;
    stim[60] = 57'h171263a152d4ee4;
    stim[61] = 57'h056928aeed3c311;
    stim[62] = 57'h1b84d51f076675b;
    stim[63] = 57'h0b499275c80f14d;
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
      expv[0] = 57'hxxxxxxxxxxxxxxx;
      expv[1] = 57'h129f22cea90b011;
      expv[2] = 57'h0abef68164e4df7;
      expv[3] = 57'h15e611160887324;
      expv[4] = 57'h1e9fbfbf9391d8b;
      expv[5] = 57'h15352e3ceb45b82;
      expv[6] = 57'h1b0f6e675b82129;
      expv[7] = 57'h0eb98dca1c929b9;
      expv[8] = 57'h17772d159283985;
      expv[9] = 57'h146f8a7f3597572;
      expv[10] = 57'h0bf1be5dee0e94c;
      expv[11] = 57'h0d7a76e67971bd7;
      expv[12] = 57'h18fd0fbc9f588bf;
      expv[13] = 57'h06d5f9f3236af3a;
      expv[14] = 57'h0286e6f83312a8b;
      expv[15] = 57'h0fa736ff19d5684;
      expv[16] = 57'h03445551fd031f7;
      expv[17] = 57'h120a9a1314fd12c;
      expv[18] = 57'h0660caa4ef1eea3;
      expv[19] = 57'h11f6128f299916b;
      expv[20] = 57'h189756d18255133;
      expv[21] = 57'h1493718a48fb623;
      expv[22] = 57'h1254719ceb4664c;
      expv[23] = 57'h0e0da1415760aa6;
      expv[24] = 57'h05985c9a70c0744;
      expv[25] = 57'h154bb366c5a8309;
      expv[26] = 57'h1c5782188a140b3;
      expv[27] = 57'h112267c7771de71;
      expv[28] = 57'h01e8d6a20592a2a;
      expv[29] = 57'h17bd0ddbf2de97e;
      expv[30] = 57'h028ffcc05da47a8;
      expv[31] = 57'h11b3d402a44abf3;
      expv[32] = 57'h01d5628d6c8cb8e;
      expv[33] = 57'h06aeb83168baa10;
      expv[34] = 57'h03c24668caa487a;
      expv[35] = 57'h0d3cf0eee04e5f8;
      expv[36] = 57'h1062bd6d8ce3624;
      expv[37] = 57'h08dc3102fc2dde0;
      expv[38] = 57'h1890ae3ee4baf06;
      expv[39] = 57'h174ff3f8f502c80;
      expv[40] = 57'h1bc77c4f0e0d2ba;
      expv[41] = 57'h19237529aa38c29;
      expv[42] = 57'h146b9343ad8dc8a;
      expv[43] = 57'h10197718d6c4981;
      expv[44] = 57'h17985c44b0d13da;
      expv[45] = 57'h1ad2f07762af511;
      expv[46] = 57'h138af4c8d5c6f00;
      expv[47] = 57'h04dce6f2a0eef41;
      expv[48] = 57'h0abc6210f31b170;
      expv[49] = 57'h1fae4797b984cf9;
      expv[50] = 57'h02caa82647befba;
      expv[51] = 57'h0c98ccec023bfc5;
      expv[52] = 57'h0a30ebd8a6e59a9;
      expv[53] = 57'h1ee1cd2f0c555b6;
      expv[54] = 57'h1cd5514c3e8c0f3;
      expv[55] = 57'h1ffa80e75b1b8c0;
      expv[56] = 57'h1b1f7d432dc2bff;
      expv[57] = 57'h137abf004d015de;
      expv[58] = 57'h1982f878000e956;
      expv[59] = 57'h0d8dd78bf4ea868;
      expv[60] = 57'h14a00e1eebe8e6f;
      expv[61] = 57'h0e24c742a5d4ee4;
      expv[62] = 57'h0ad2515dda3c311;
      expv[63] = 57'h1709aa3e0ee675b;
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
