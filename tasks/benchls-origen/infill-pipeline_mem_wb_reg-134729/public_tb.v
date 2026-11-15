// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134729 dut (
    .clk(clk),
    .ctlwb_out(in_vec[106:105]),
    .ctlm_out(in_vec[104:102]),
    .adder_out(in_vec[101:70]),
    .aluzero(in_vec[69:69]),
    .aluout(in_vec[68:37]),
    .readdat2(in_vec[36:5]),
    .muxout(in_vec[4:0]),
    .wb_ctlout(out_vec[103:103]),
    .m_ctlout(out_vec[102:102]),
    .add_result(out_vec[101:70]),
    .zero(out_vec[69:69]),
    .alu_result(out_vec[68:37]),
    .rdata2out(out_vec[36:5]),
    .five_bit_muxout(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h63bc17a8ee8c91bb0f9e0bd57cc;
    stim[1] = 107'h2681a85ce983bea085988ca2975;
    stim[2] = 107'h4fd6a028d4a8a24a0c0a189d087;
    stim[3] = 107'h444cd7a364623b1bfd899fbf089;
    stim[4] = 107'h2847533cc1d9dab57ffb7194c65;
    stim[5] = 107'h6469170ec3bb7f8203341a1b9f0;
    stim[6] = 107'h4b6cd1629c1f7e0c33319801e58;
    stim[7] = 107'h24c0382fc0a2b73ca113d2eacfb;
    stim[8] = 107'h0750497d2b903c3aa3d0f352451;
    stim[9] = 107'h75204a49a4cd952e419db212a1c;
    stim[10] = 107'h2c1125143b12e05deabf94e9401;
    stim[11] = 107'h5769ccafc752c79214ecfa81838;
    stim[12] = 107'h0b3425feda8bf5091266a19e1c5;
    stim[13] = 107'h5657453610052ebcdfe426e1340;
    stim[14] = 107'h68650371d9577ecd1e342207175;
    stim[15] = 107'h5d51f01c168cc9979fd826bd2ca;
    stim[16] = 107'h0ba01b2433026ecce5f52255754;
    stim[17] = 107'h0d4f2b31bc4c63ab39c81bd4b27;
    stim[18] = 107'h72ff70a5aafd6348607ce44e0e9;
    stim[19] = 107'h00622c23e58e416c9577666c888;
    stim[20] = 107'h7168127a18b204bde77f372758e;
    stim[21] = 107'h6575eafe24e9c83c7e88f0bfafc;
    stim[22] = 107'h526ef006e18ce2139b146e9dde6;
    stim[23] = 107'h40bac455d31ed385884782375ec;
    stim[24] = 107'h0c3baabd22ab0c1c63268973d9a;
    stim[25] = 107'h3ff89760b125966436318c9e808;
    stim[26] = 107'h480d834574dc09d36c586628fff;
    stim[27] = 107'h2dc64126212318d963d091bee0c;
    stim[28] = 107'h5a71b0c755490e66024dba967da;
    stim[29] = 107'h3f9ee6d0e79f0ddc975f7c2bc63;
    stim[30] = 107'h2cc6891438a23f50159f899a73e;
    stim[31] = 107'h6d02aa7fc8e8d7aaf021ec9f585;
    stim[32] = 107'h64b9cf4d5679d20ee72418d5aad;
    stim[33] = 107'h2737eb91a399abce5f238981b83;
    stim[34] = 107'h0d0af80e703d7e46dd6768c9c3b;
    stim[35] = 107'h11a8b0c2ec936f39182871692f9;
    stim[36] = 107'h7dbde3c8e44c93275c3d64731a8;
    stim[37] = 107'h461cfdb0c36b256cf6c4be7bd1d;
    stim[38] = 107'h4c36721841751a49767a7b01773;
    stim[39] = 107'h6e992b13f1b1b51f53995e783a9;
    stim[40] = 107'h4ea0e78121efb5e92ff1efb3806;
    stim[41] = 107'h67364fc69e5fd9cc8ea64691d04;
    stim[42] = 107'h05065f86e3ff9bcb15e23ac7faf;
    stim[43] = 107'h3b8df5f165e14982bc824661fc6;
    stim[44] = 107'h0e952bf8ea9a3f1f40c0d2d5940;
    stim[45] = 107'h6aea42d509a1e02cc8324533ed2;
    stim[46] = 107'h6d159d8ded7d16b943af6796a90;
    stim[47] = 107'h61deb57c302590998b752c3302c;
    stim[48] = 107'h366645953b1cd70c25c8d4a133c;
    stim[49] = 107'h6ce955c2ed7cdef9c4844586ed3;
    stim[50] = 107'h66babd22560533a7e711ba244a1;
    stim[51] = 107'h61a561f4d56f088f27e3a0446da;
    stim[52] = 107'h107ee0fcecfa7b60bf87aa3501a;
    stim[53] = 107'h19c0f423a960e9184a66934800a;
    stim[54] = 107'h08928d9b8664eea162b37b0eeab;
    stim[55] = 107'h111498fff3738e800919deaa250;
    stim[56] = 107'h4faacece0159235986e2c125056;
    stim[57] = 107'h4483d1d1b7dc8ea2f8b3b7b65c0;
    stim[58] = 107'h4ecac41e8f4b08ad93d2e20726b;
    stim[59] = 107'h7729c40c822dcbf26645e947e2c;
    stim[60] = 107'h0d05b34a5852716e0032e786336;
    stim[61] = 107'h3604a3a9832be27d3cfb9fc9093;
    stim[62] = 107'h77e7551b70069ec03534c9473ce;
    stim[63] = 107'h2d12a27173b1759d09ec3c4b074;
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
      expv[0] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 104'h3bc17a8fe8c91bb0f9e0bd57c0;
      expv[2] = 104'ha81a85cf983bea085988ca2975;
      expv[3] = 104'h7d6a028e4a8a24a0c0a189d083;
      expv[4] = 104'h44cd7a374623b1bfd899fbf083;
      expv[5] = 104'h847533cd1d9dab57ffb7194c75;
      expv[6] = 104'h069170ed3bb7f8203341a1b9e0;
      expv[7] = 104'h76cd162ac1f7e0c33319801e43;
      expv[8] = 104'h8c0382fd0a2b73ca113d2eacf5;
      expv[9] = 104'h350497d3b903c3aa3d0f352440;
      expv[10] = 104'h1204a49b4cd952e419db212a00;
      expv[11] = 104'h81125144b12e05deabf94e9415;
      expv[12] = 104'h769ccafd752c79214ecfa81823;
      expv[13] = 104'h33425feea8bf5091266a19e1c0;
      expv[14] = 104'h657453620052ebcdfe426e1343;
      expv[15] = 104'h0650371e9577ecd1e342207160;
      expv[16] = 104'h551f01c268cc9979fd826bd2c3;
      expv[17] = 104'h3a01b2443026ecce5f52255740;
      expv[18] = 104'h14f2b31cc4c63ab39c81bd4b20;
      expv[19] = 104'h2ff70a5bafd6348607ce44e0e0;
      expv[20] = 104'h0622c23f58e416c9577666c880;
      expv[21] = 104'h168127a28b204bde77f3727580;
      expv[22] = 104'h175eafe34e9c83c7e88f0bfae0;
      expv[23] = 104'h66ef006f18ce2139b146e9dde3;
      expv[24] = 104'h4bac455e31ed385884782375e3;
      expv[25] = 104'h03baabd32ab0c1c63268973d80;
      expv[26] = 104'hbf89760c125966436318c9e815;
      expv[27] = 104'h40d834584dc09d36c586628fe3;
      expv[28] = 104'h9c64126312318d963d091bee15;
      expv[29] = 104'h671b0c765490e66024dba967c3;
      expv[30] = 104'hb9ee6d0f79f0ddc975f7c2bc75;
      expv[31] = 104'h8c6891448a23f50159f899a735;
      expv[32] = 104'h102aa7fd8e8d7aaf021ec9f580;
      expv[33] = 104'h0b9cf4d6679d20ee72418d5aa0;
      expv[34] = 104'hb37eb91b399abce5f238981b95;
      expv[35] = 104'h10af80e803d7e46dd6768c9c20;
      expv[36] = 104'h1a8b0c2fc936f39182871692e0;
      expv[37] = 104'h1bde3c8f44c93275c3d64731a0;
      expv[38] = 104'h61cfdb0d36b256cf6c4be7bd03;
      expv[39] = 104'h436721851751a49767a7b01763;
      expv[40] = 104'h2992b1401b1b51f53995e783a0;
      expv[41] = 104'h6a0e78131efb5e92ff1efb3803;
      expv[42] = 104'h3364fc6ae5fd9cc8ea64691d00;
      expv[43] = 104'h1065f86f3ff9bcb15e23ac7fa0;
      expv[44] = 104'hb8df5f175e14982bc824661fd5;
      expv[45] = 104'h2952bf8fa9a3f1f40c0d2d5940;
      expv[46] = 104'h2ea42d519a1e02cc8324533ec0;
      expv[47] = 104'h1159d8dfd7d16b943af6796a80;
      expv[48] = 104'h1deb57c402590998b752c33020;
      expv[49] = 104'ha6645954b1cd70c25c8d4a1335;
      expv[50] = 104'h0e955c2fd7cdef9c4844586ec0;
      expv[51] = 104'h2babd22660533a7e711ba244a0;
      expv[52] = 104'h1a561f4e56f088f27e3a0446c0;
      expv[53] = 104'h07ee0fcfcfa7b60bf87aa35000;
      expv[54] = 104'h1c0f423b960e9184a669348000;
      expv[55] = 104'h0928d9b9664eea162b37b0eea0;
      expv[56] = 104'h114990003738e800919deaa240;
      expv[57] = 104'h7aacece1159235986e2c125043;
      expv[58] = 104'h483d1d1c7dc8ea2f8b3b7b65c3;
      expv[59] = 104'h6cac41e9f4b08ad93d2e207263;
      expv[60] = 104'h329c40c922dcbf26645e947e20;
      expv[61] = 104'h105b34a6852716e0032e786320;
      expv[62] = 104'ha04a3a9932be27d3cfb9fc9095;
      expv[63] = 104'h3e7551b80069ec03534c9473c0;
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
