// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059920 dut (
    .A(in_vec[100:99]),
    .Dout(in_vec[98:67]),
    .op(in_vec[66:64]),
    .PrRD(in_vec[63:32]),
    .addr(in_vec[31:0]),
    .Doutext(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h1a0a15c9132bd04f9eb6cb56bd;
    stim[1] = 101'h06bc0ea3fc3be83192fd483266;
    stim[2] = 101'h093eb0f4aafd295c0fb560bc94;
    stim[3] = 101'h17a4dc2ea685f95769de9eebaa;
    stim[4] = 101'h0428d409b79789e0744d465a22;
    stim[5] = 101'h1e670b4d7b16d068bdbbf0e8d8;
    stim[6] = 101'h1e94e63beefc76ce6818950898;
    stim[7] = 101'h0942f1148b05d9421e97680505;
    stim[8] = 101'h0af845f49a767f65237a9b9cbe;
    stim[9] = 101'h14be84304884ad18cfdd1aca90;
    stim[10] = 101'h034721ca939fd74ff02370ad15;
    stim[11] = 101'h0cea2a5ee363a21667d6005eb5;
    stim[12] = 101'h02241925044fb9a531abd7dcb2;
    stim[13] = 101'h015d0fa6b5f26924acb5b5dd04;
    stim[14] = 101'h15481403b420e0ed66478245d4;
    stim[15] = 101'h06efc0caf8e4d13a75aa6fc7fb;
    stim[16] = 101'h03617d023fd8f87a7ad38d621d;
    stim[17] = 101'h1dc9ef86ba0a9d0bca3c4ea4ef;
    stim[18] = 101'h10382fd4fb88326a9ab28e599b;
    stim[19] = 101'h15900df724efb287a51fd96977;
    stim[20] = 101'h1faf4570abda6ffe13727807ab;
    stim[21] = 101'h0879336755da94d5e51e83cf98;
    stim[22] = 101'h1799bb88a09446070f6af2c9db;
    stim[23] = 101'h1193c4868136294dd1b95a3e74;
    stim[24] = 101'h0723cabad055c900a7c6b62520;
    stim[25] = 101'h1f70bd1ce9a203247c83d7ded1;
    stim[26] = 101'h0f73cb7179397bc33321771b72;
    stim[27] = 101'h0947953b2c778093c35ab8a531;
    stim[28] = 101'h1486aa0536cc485eced07b0f6e;
    stim[29] = 101'h08108aa5cb926dc44b5072c910;
    stim[30] = 101'h0b78b792cbeb3034fd2126fc60;
    stim[31] = 101'h19f21825c0b2ef235bdeb31dda;
    stim[32] = 101'h0d4f89b3573733d753e91f9f19;
    stim[33] = 101'h17cdd0fd46962dcd51dd6e2f50;
    stim[34] = 101'h0d4fbc2122fbe0cedc0fc3b530;
    stim[35] = 101'h0ed3c513381386b63dd31b1722;
    stim[36] = 101'h01e0e144dda77e85acc068efa3;
    stim[37] = 101'h045b73159dff636565c3cbe123;
    stim[38] = 101'h1ba5bbf177760a33723b02f728;
    stim[39] = 101'h0fbdbd3902c636d57fec00530e;
    stim[40] = 101'h0028afbc6a735d2a08fbb98395;
    stim[41] = 101'h17b8590917d51b784a1818c68e;
    stim[42] = 101'h037861050ab4fc8ac16fd07074;
    stim[43] = 101'h137bab506de10409076cb84ed0;
    stim[44] = 101'h12b6126c17f359e04418c057dd;
    stim[45] = 101'h07efb28ba6e55b63e227b2b724;
    stim[46] = 101'h0da5d9448eae71b6e64562bb75;
    stim[47] = 101'h1b9b819c5b5740117a055dce87;
    stim[48] = 101'h08739be5dd8dc90537c98efe66;
    stim[49] = 101'h1ed59fc58df914d0004e1f5c05;
    stim[50] = 101'h109ffab70be0f3cc968385c97e;
    stim[51] = 101'h0731ec8f570696e83058ae95b1;
    stim[52] = 101'h13d4b85f03172a2871edb7b8a4;
    stim[53] = 101'h04048ed983c4d1f529b4fc8d4b;
    stim[54] = 101'h05bc5da42ad038b86c608b4f17;
    stim[55] = 101'h0077784fb1639685bbfab8394c;
    stim[56] = 101'h0494dc236514edb99e73e82ba8;
    stim[57] = 101'h18f64bf0b8a0972aae8fb256ba;
    stim[58] = 101'h033e27b74b18937d92bb621d17;
    stim[59] = 101'h15858498d832d38f2e76484787;
    stim[60] = 101'h00a81bdaed6426ab3683329b1f;
    stim[61] = 101'h121436d8c343b57468b5c49b80;
    stim[62] = 101'h10e2d1d4829dbc2996af41e587;
    stim[63] = 101'h0b21287e46fb5fc16dbc0d2e38;
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
      expv[0] = 32'h00004142;
      expv[1] = 32'hffffd47f;
      expv[2] = 32'h0000001e;
      expv[3] = 32'hf49b85d4;
      expv[4] = 32'h851a8136;
      expv[5] = 32'h0000cce1;
      expv[6] = 32'hd29cc77d;
      expv[7] = 32'h00002291;
      expv[8] = 32'hffffffbe;
      expv[9] = 32'h97d08609;
      expv[10] = 32'h00003952;
      expv[11] = 32'h00004bdc;
      expv[12] = 32'h000024a0;
      expv[13] = 32'h2ba1f4d6;
      expv[14] = 32'hffffa902;
      expv[15] = 32'hddf8195f;
      expv[16] = 32'h6c2fa047;
      expv[17] = 32'hffffffb9;
      expv[18] = 32'h00000705;
      expv[19] = 32'hffffb201;
      expv[20] = 32'h0000f5e8;
      expv[21] = 32'h0f266cea;
      expv[22] = 32'hf3377114;
      expv[23] = 32'h00000078;
      expv[24] = 32'he479575a;
      expv[25] = 32'h000000ee;
      expv[26] = 32'h0000006e;
      expv[27] = 32'hffffa765;
      expv[28] = 32'h90d540a6;
      expv[29] = 32'h000054b9;
      expv[30] = 32'h0000f259;
      expv[31] = 32'h3e4304b8;
      expv[32] = 32'ha9f1366a;
      expv[33] = 32'hf9ba1fa8;
      expv[34] = 32'hffffff84;
      expv[35] = 32'hda78a267;
      expv[36] = 32'h3c1c289b;
      expv[37] = 32'h8b6e62b3;
      expv[38] = 32'h74b77e2e;
      expv[39] = 32'hffffffa7;
      expv[40] = 32'hffffff8d;
      expv[41] = 32'hf70b2122;
      expv[42] = 32'hffffffa1;
      expv[43] = 32'h6f756a0d;
      expv[44] = 32'h56c24d82;
      expv[45] = 32'hfdf65174;
      expv[46] = 32'hb4bb2891;
      expv[47] = 32'h00007370;
      expv[48] = 32'h0e737cbb;
      expv[49] = 32'hdab3f8b1;
      expv[50] = 32'h000013ff;
      expv[51] = 32'he63d91ea;
      expv[52] = 32'h00007a97;
      expv[53] = 32'h0000db30;
      expv[54] = 32'hffffff85;
      expv[55] = 32'h000000f6;
      expv[56] = 32'h929b846c;
      expv[57] = 32'h1ec97e17;
      expv[58] = 32'h0000f6e9;
      expv[59] = 32'hb0b0931b;
      expv[60] = 32'h15037b5d;
      expv[61] = 32'h00004286;
      expv[62] = 32'h0000005a;
      expv[63] = 32'h64250fc8;
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
